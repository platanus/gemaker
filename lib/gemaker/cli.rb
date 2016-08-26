module Gemaker
  class Cli
    include Commander::Methods

    def run
      program :name, "Gemaker"
      program :version, Gemaker::VERSION
      program :description, "CLI to generate Platanus gems"
      define_new_cmd
      run!
    end

    private

    def define_new_cmd
      command("new") do |c|
        c.syntax = "gemaker new"
        c.description = "Create a new gem with Platanus configuration"
        c.action { puts "TODO" }
      end
    end
  end
end
