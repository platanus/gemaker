module Gemaker
  module Cmd
    class ConfigureEditorConfig < Gemaker::Cmd::Base
      def perform
        copy_file("editorconfig", ".editorconfig")
        info "Configure editorconfig"
      end
    end
  end
end
