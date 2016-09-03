module Gemaker
  module Cmd
    class CustomizeRakefile < Gemaker::Cmd::Base
      def in_normal_context
        customize_rakefile("normal/Rakefile")
      end

      def in_engine_context
        customize_rakefile("engine/Rakefile")
      end

      private

      def customize_rakefile(template)
        copy_file(template, "Rakefile")
        info "Customize Rakefile"
      end
    end
  end
end
