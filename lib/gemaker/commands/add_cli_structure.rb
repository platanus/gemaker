module Gemaker
  module Cmd
    class AddCliStructure < Gemaker::Cmd::Base
      def perform
        return unless @config.cli?

        copy_template("exe", "exe/#{@config.gem_name}", config: @config)
        copy_template("cli.rb", "lib/#{@config.gem_name}/cli.rb", config: @config)
        info "Add CLI structure"
      end
    end
  end
end
