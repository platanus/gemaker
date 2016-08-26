module Gemaker
  module Cmd
    class AddReadme < Gemaker::Cmd::Base
      def perform
        copy_template("README.md", "README.md", config: @config)
        puts "Replace README.md"
      end
    end
  end
end
