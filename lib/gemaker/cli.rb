module Gemaker
  class Cli
    include Commander::Methods

    def run
      config = Gemaker::Config.new
      validator = Gemaker::Validator.new(config)
      program :name, "Gemaker"
      program :version, Gemaker::VERSION
      program :description, "CLI to generate Platanus gems"
      define_new_cmd(config, validator)
      run!
    end

    private

    def define_new_cmd(config, validator)
      command("new") do |c|
        c.syntax = "gemaker new"
        c.description = "Create a new gem with Platanus configuration"
        c.action do |args|
          fill_config(args.first, config, validator)
          Gemaker::Cmd::CreateGem.for(config: config)
          Gemaker::Cmd::AddReadme.for(config: config)
          Gemaker::Cmd::AddChangelog.for(config: config)
          Gemaker::Cmd::CustomizeGemspec.for(config: config)
          Gemaker::Cmd::AddLicense.for(config: config)
        end
      end
    end

    def fill_config(gem_name, config, validator)
      config.gem_name = gem_name

      if !validator.defined_gem_name?
        config.gem_name = ask("Gem name it's mandatory. Please, enter name...")
      end

      config.human_gem_name = ask(
        "Enter the human readable version of the name like \"#{config.human_gem_name}\":")

      config.summary = ask("Enter gem's summary: ")
      config.description = ask("Enter gem's description: ")
      config.homepage = ask("Enter gem's homepage: ")
      config.authors = ask("Enter gem's authors: ")
      config.emails = ask("Enter the authors' emails: ")

      while !validator.authors_match_emails?
        config.emails = ask("Number of emails must match authors. Please, retry...")
      end

      config.gem_type = :engine if agree("It's a Rails Engine?")
    end
  end
end
