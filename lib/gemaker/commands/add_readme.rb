module Gemaker
  module Cmd
    class AddReadme < Gemaker::Cmd::Base
      def in_normal_context
        copy_template("normal/README.md", "README.md", config: @config)
        info "Replace README.md"
      end

      def in_engine_context
        remove_in_gem("README.rdoc")
        copy_template("engine/README.md", "README.md", config: @config)
        info "Replace README.md"
      end
    end
  end
end
