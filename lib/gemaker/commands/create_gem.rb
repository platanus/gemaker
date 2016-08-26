module Gemaker
  module Cmd
    class CreateGem < Gemaker::Cmd::Base
      def perform
        if @config.engine?
          create_rails_engine
          return
        end

        create_normal_gem
      end

      private

      def create_rails_engine
        puts "TODO"
      end

      def create_normal_gem
        printf `bundle gem #{@config.gem_name}`
      end
    end
  end
end
