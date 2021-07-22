module Gemaker
  module Cmd
    class CustomizeEngine < Gemaker::Cmd::Base
      def in_engine_context
        remove_in_gem("spec/dummy/config/environments/development.rb")
        copy_template(
          "engine/development.rb",
          "spec/dummy/config/environments/development.rb",
          config: @config
        )
        copy_template("engine/engine.rb",
          "lib/#{@config.gem_name}/engine.rb", config: @config)
        copy_template("engine/example_class.rb",
          "lib/#{@config.gem_name}/example_class.rb", config: @config)
        info "Customize engine.rb"
      end
    end
  end
end
