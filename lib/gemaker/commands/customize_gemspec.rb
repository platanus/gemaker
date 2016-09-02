module Gemaker
  module Cmd
    class CustomizeGemspec < Gemaker::Cmd::Base
      def in_normal_context
        copy_gempsec("normal/gemspec")
      end

      def in_engine_context
        copy_gempsec("engine/gemspec")
      end

      private

      def copy_gempsec(template)
        copy_template(template, "#{@config.gem_name}.gemspec", config: @config)
        puts "Customize #{@config.gem_name}.gemspec"
      end
    end
  end
end
