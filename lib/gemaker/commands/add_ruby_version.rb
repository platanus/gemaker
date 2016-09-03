module Gemaker
  module Cmd
    class AddRubyVersion < Gemaker::Cmd::Base
      def perform
        copy_template("ruby-version", ".ruby-version", config: @config)
        info "Add .ruby-version file"
      end
    end
  end
end
