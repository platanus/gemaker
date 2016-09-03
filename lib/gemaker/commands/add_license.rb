module Gemaker
  module Cmd
    class AddLicense < Gemaker::Cmd::Base
      def perform
        copy_template("LICENSE.txt", "LICENSE.txt")
        rm_rf("MIT-LICENSE")
        puts "Add LICENSE.txt"
      end
    end
  end
end
