module Gemaker
  class Cli
    include Commander::Methods

    def run
      config = Gemaker::Config.new
      program :name, "Gemaker"
      program :version, Gemaker::VERSION
      program :description, "CLI to generate Platanus gems"
      define_new_cmd(config)
      run!
    end

    private

    def define_new_cmd(config)
      command("new") do |c|
        c.syntax = "gemaker new"
        c.description = "Create a new gem with Platanus configuration"
        c.action do |args|
          fill_config(args.first, config)
          Gemaker::Cmd::CreateGem.for(config: config)
          Gemaker::Cmd::AddReadme.for(config: config)
          Gemaker::Cmd::AddChangelog.for(config: config)
          Gemaker::Cmd::CustomizeGemspec.for(config: config)
          Gemaker::Cmd::AddLicense.for(config: config)
          Gemaker::Cmd::AddCliStructure.for(config: config)
          Gemaker::Cmd::ConfigureTestEnv.for(config: config)
          Gemaker::Cmd::AddRubyVersion.for(config: config)
          Gemaker::Cmd::ExecuteGitInit.for(config: config)
        end
      end
    end

    def fill_config(gem_name, config)
      config.gem_name = gem_name

      if config.gem_name.blank?
        config.gem_name = ask("Gem name it's mandatory. Please, enter name...")
      end

      config.human_gem_name = ask(
        "Enter the human readable version of the name like \"#{config.human_gem_name}\":")
      config.summary = ask("Enter gem's summary: ")
      config.description = ask("Enter gem's description: ")
      config.homepage = ask("Enter gem's homepage: ")
      config.authors = ask("Enter gem's authors: ")
      config.emails = ask("Enter the authors' emails: ")
      config.engine = agree("It's a Rails Engine?")
      config.cli = agree("It's a CLI?")
    end
  end
end
