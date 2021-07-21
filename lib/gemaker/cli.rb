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
          draw_artii("Platanus")
          fill_config(args.first, config)
          Gemaker::Cmd::CreateGem.for(config: config)
        end
      end
    end

    # rubocop:disable Metrics/MethodLength
    def fill_config(gem_name, config)
      config.gem_name = gem_name

      if config.gem_name.blank?
        config.gem_name = ask("Gem name it's mandatory. Please, enter name...")
      end

      config.human_gem_name = ask(
        "Enter the human readable version of the name. e.g. \"#{config.human_gem_name}\":"
      )
      config.summary = ask("Enter gem's summary: ")
      config.description = ask("Enter gem's description: ")
      config.homepage = ask(
        "Enter gem's homepage. e.g. https://github.com/platanus/#{config.gem_name}: "
      )
      config.authors = ask("Enter gem's authors. e.g. Sherlock Holmes,James Moriarty: ")
      config.emails = ask(
        "Enter the authors' emails. e.g. sherlock@platan.us,james@platan.us: "
      )
      config.engine = agree("Is the gem a Rails engine?")

      if config.engine?
        config.installable = agree("Need an installer?")
      else
        config.cli = agree("Is it a CLI (Command-line interface)?")
      end
    end
    # rubocop:enable Metrics/MethodLength

    def draw_artii(text)
      a = Artii::Base.new font: 'slant'
      puts a.asciify(text).yellow
    end
  end
end
