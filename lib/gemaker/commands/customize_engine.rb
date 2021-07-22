module Gemaker
  module Cmd
    class CustomizeEngine < Gemaker::Cmd::Base
      def in_engine_context
        replace_development_file
        replace_engine_file
        add_example_class

        info "Customize engine.rb"
      end

      private

      def replace_development_file
        remove_in_gem("spec/dummy/config/environments/development.rb")
        copy_template(
          "engine/development.rb",
          "spec/dummy/config/environments/development.rb",
          config: @config
        )
      end

      def replace_engine_file
        copy_template(
          "engine/engine.rb",
          "lib/#{@config.gem_name}/engine.rb",
          config: @config
        )
      end

      def add_example_class
        copy_template(
          "engine/example_class.rb",
          "lib/#{@config.gem_name}/example_class.rb",
          config: @config
        )
      end
    end
  end
end
