module Gemaker
  module Cmd
    class CreateGem < Gemaker::Cmd::Base
      def in_engine_context
        mountable_opt = "--mountable" if @config.mountable?
        create_customized_gem(
          "rails plugin new #{@config.gem_name} -T #{mountable_opt} --dummy-path=spec/dummy")
      end

      def in_normal_context
        create_customized_gem("bundle gem #{@config.gem_name}")
      end

      private

      def create_customized_gem(cmd)
        execute(cmd)
        Gemaker::Cmd::AddReadme.for(config: @config)
        Gemaker::Cmd::AddChangelog.for(config: @config)
        Gemaker::Cmd::CustomizeGemspec.for(config: @config)
        Gemaker::Cmd::AddLicense.for(config: @config)
        Gemaker::Cmd::AddCliStructure.for(config: @config)
        Gemaker::Cmd::ConfigureTestEnv.for(config: @config)
        Gemaker::Cmd::AddRubyVersion.for(config: @config)
        Gemaker::Cmd::CustomizeEngine.for(config: @config)
        Gemaker::Cmd::CustomizeRakefile.for(config: @config)
        Gemaker::Cmd::CustomizeMainLibFile.for(config: @config)
        Gemaker::Cmd::AddInstallGenerator.for(config: @config)
        Gemaker::Cmd::ConfigureGit.for(config: @config)
        Gemaker::Cmd::AddHoundRules.for(config: @config)
        info("Done!")
      end
    end
  end
end
