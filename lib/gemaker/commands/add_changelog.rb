module Gemaker
  module Cmd
    class AddChangelog < Gemaker::Cmd::Base
      def perform
        copy_file("CHANGELOG.md", "CHANGELOG.md")
        info "Create CHANGELOG.md"
      end
    end
  end
end
