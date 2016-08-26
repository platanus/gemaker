module Gemaker
  module Cmd
    class Base < PowerTypes::Command.new(:config)
      include Gemaker::FileUtils
    end
  end
end
