module Gemaker
  module Cmd
    class AddChangelog < Gemaker::Cmd::Base
      def perform
        copy_file("CHANGELOG.md", "CHANGELOG.md")
        puts "Create CHANGELOG.md"
      end
    end
  end
end