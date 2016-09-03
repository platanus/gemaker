module Gemaker
  module Cmd
    class Base < PowerTypes::Command.new(:config)
      include Gemaker::Util

      def perform
        if @config.engine?
          in_engine_context
          return
        end

        in_normal_context
      end

      def in_engine_context
        # Override on child classes
      end

      def in_normal_context
        # Override on child classes
      end
    end
  end
end
