module Gemaker
  module Cmd
    class AddLicense < Gemaker::Cmd::Base
      def perform
        copy_template("LICENSE.txt", "LICENSE.txt")
        puts "Add LICENSE.txt"
      end
    end
  end
end
