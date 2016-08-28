module Gemaker
  module Cmd
    class CustomizeGemspec < Gemaker::Cmd::Base
      def perform
        copy_template("gemspec", "#{@config.gem_name}.gemspec", config: @config)
        puts "Customize #{@config.gem_name}.gemspec"
      end
    end
  end
end
