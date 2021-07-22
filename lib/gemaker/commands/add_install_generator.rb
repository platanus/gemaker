module Gemaker
  module Cmd
    class AddInstallGenerator < Gemaker::Cmd::Base
      def in_engine_context
        return unless @config.installable?

        copy_initializer
        copy_install_generator
        copy_install_usage_file
        info "Add Installer"
      end

      private

      def copy_initializer
        copy_template(
          "engine/initializer.rb",
          "lib/generators/#{@config.gem_name}/install/templates/initializer.rb",
          config: @config
        )
      end

      def copy_install_generator
        copy_template(
          "engine/install_generator.rb",
          "lib/generators/#{@config.gem_name}/install/install_generator.rb",
          config: @config
        )
      end

      def copy_install_usage_file
        copy_template(
          "engine/install_usage",
          "lib/generators/#{@config.gem_name}/install/USAGE",
          config: @config
        )
      end
    end
  end
end
