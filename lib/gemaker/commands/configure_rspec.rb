module Gemaker
  module Cmd
    class ConfigureRspec < Gemaker::Cmd::Base
      def perform
        copy_template("spec_helper.rb", "spec/spec_helper.rb", config: @config)
        create_dir("spec/support")
        puts "Configure Rspec"
      end
    end
  end
end
