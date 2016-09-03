module Gemaker
  module Cmd
    class AddLicense < Gemaker::Cmd::Base
      def perform
        copy_template("LICENSE.txt", "LICENSE.txt")
        remove_in_gem("MIT-LICENSE")
        info "Add LICENSE.txt"
      end
    end
  end
end
