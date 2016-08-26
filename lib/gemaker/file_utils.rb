module Gemaker
  module FileUtils
    def copy_file(source, destination)
      ::FileUtils.cp(template(source), File.join(gem_root_path, destination))
    end

    def copy_template(source, destination, locales = {})
      template_path = template(source)
      destination_path = File.join(gem_root_path, destination)
      input = File.open(template_path)
      output = File.open(destination_path, "w+")
      b = binding
      locales.each { |k, v| singleton_class.send(:define_method, k) { v } }
      result = ERB.new(input.read).result(b)
      output.write(result)
      output.close()
      input.close()
    end

    private

    def gem_root_path
      File.join(Dir.pwd, @config.gem_name)
    end

    def template(file_path)
      File.join(utils_path, "templates", file_path + ".erb")
    end

    def utils_path
      File.dirname(__FILE__)
    end

    def read_file(path)
      File.read(path)
    end
  end
end
