module Gemaker
  module Cmd
    class CustomizeGemspec < Gemaker::Cmd::Base
      def in_normal_context
        copy_template("normal/gemspec", "#{@config.gem_name}.gemspec", config: @config)
        puts "Customize #{@config.gem_name}.gemspec"
      end
    end
  end
end
