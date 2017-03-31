module Gemaker
  module Cmd
    class ConfigureTravis < Gemaker::Cmd::Base
      def in_normal_context
        copy_template("normal/travis.yml", ".travis.yml", config: @config)
        info "Configure Tavis"
      end

      def in_engine_context
        copy_template("engine/travis.yml", ".travis.yml", config: @config)
        info "Configure Tavis"
      end
    end
  end
end
