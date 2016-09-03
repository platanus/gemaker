module Gemaker
  module Cmd
    class CustomizeRakefile < Gemaker::Cmd::Base
      def in_normal_context
        customize_rakefile("normal")
      end

      def in_engine_context
        customize_rakefile("engine")
      end

      private

      def customize_rakefile(from)
        copy_file("#{from}/Rakefile", "Rakefile")
        puts "Customize Rakefile"
      end
    end
  end
end
