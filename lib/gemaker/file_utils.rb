module Gemaker
  module FileUtils
    def copy_file(source, destination)
      ::FileUtils.cp(get_template_path(source), get_destination_path(destination))
    end

    def copy_template(source, destination, locales = {})
      template_path = get_template_path(source)
      destination_path = get_destination_path(destination)

      input = File.open(template_path)
      output = File.open(destination_path, "w+")
      output.write(parse_erb(input.read, locales))
      output.close
      input.close
    end

    private

    def get_destination_path(destination)
      destination_path = File.join(gem_root_path, destination)
      ::FileUtils.mkdir_p(File.dirname(destination_path))
      destination_path
    end

    def get_template_path(file_path)
      File.join(utils_path, "templates", file_path + ".erb")
    end

    def gem_root_path
      File.join(Dir.pwd, @config.gem_name)
    end

    def utils_path
      File.dirname(__FILE__)
    end

    def parse_erb(content, data)
      b = binding
      data.each { |k, v| singleton_class.send(:define_method, k) { v } }
      ERB.new(content, nil, "-").result(b)
    end
  end
end
