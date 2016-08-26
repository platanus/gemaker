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
          config.gem_name = args.first
          config.summary = ask("Add Gem's summary: ")
          config.description = ask("Add Gem's description: ")
          config.homepage = ask("Add Gem's homepage: ")
          config.authors = ask("Add Gem's authors: ")
          config.emails = ask("Add Authors' emails: ")
          config.gem_type = :engine if agree("Rails engine?")
          p config
        end
      end
    end
  end
end
