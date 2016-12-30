module Gemaker
  module Cmd
    class AddHoundRules < Gemaker::Cmd::Base
      def perform
        execute_in_gem(
          "hound rules update ruby --local",
          "Missing tool. Please run `gem install hound-cli`."
        )
      end
    end
  end
end
