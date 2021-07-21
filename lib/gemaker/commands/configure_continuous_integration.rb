module Gemaker
  module Cmd
    class ConfigureContinuousIntegration < Gemaker::Cmd::Base
      def in_normal_context
        configure_ci("normal")
      end

      def in_engine_context
        configure_ci("engine")
      end

      private

      def configure_ci(tpl_dir)
        copy_template("#{tpl_dir}/rubocop.yml", ".rubocop.yml", config: @config)
        create_dir(".circleci")
        copy_template("circle_config.yml", ".circleci/config.yml", config: @config)
        copy_file("circleci-setup-script.sh", ".circleci/setup-rubygems.yml")
        info "Configure CricleCI"
      end
    end
  end
end
