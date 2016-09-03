module Gemaker
  module Util
    def copy_file(source, destination)
      ::FileUtils.cp(get_template_path(source), get_destination_path(destination))
    end

    def copy_template(source, destination, locales = {})
      template_path = get_template_path(source) + ".erb"
      destination_path = get_destination_path(destination)

      input = File.open(template_path)
      output = File.open(destination_path, "w+")
      output.write(parse_erb(input.read, locales))
      output.close
      input.close
    end

    def remove_in_gem(path)
      full_path = File.join(gem_root_path, path)

      if File.exist?(full_path)
        ::FileUtils.rm_rf(File.join(gem_root_path, path))
        return
      end

      puts "Can't delete because #{full_path} does not exist"
    end

    def execute(cmd)
      `#{cmd}`
    end

    def execute_in_gem(cmd)
      `cd #{gem_root_path}; #{cmd}; cd ..`
    end

    def create_dir(path)
      ::FileUtils.mkdir_p(get_destination_path(path))
    end

    def get_destination_path(destination)
      destination_path = File.join(gem_root_path, destination)
      ::FileUtils.mkdir_p(File.dirname(destination_path))
      destination_path
    end

    def get_template_path(file_path)
      File.join(utils_path, "templates", file_path)
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

    def info(string)
      puts ColorizedString.new(string).green
    end
  end
end
