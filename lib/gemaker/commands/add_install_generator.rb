module Gemaker
  module Cmd
    class AddInstallGenerator < Gemaker::Cmd::Base
      def in_engine_context
        copy_template("engine/initializer.rb",
          "lib/generators/#{@config.gem_name}/install/templates/initializer.rb", config: @config)
        copy_template("engine/install_generator.rb",
          "lib/generators/#{@config.gem_name}/install/install_generator.rb", config: @config)
        copy_template("engine/install_usage",
          "lib/generators/#{@config.gem_name}/install/USAGE", config: @config)
        info "Add Installer"
      end
    end
  end
end
