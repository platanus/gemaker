module Gemaker
  module Cmd
    class CreateGem < Gemaker::Cmd::Base
      def perform
        p @config
      end
    end
  end
end
