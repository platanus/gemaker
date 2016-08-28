module Gemaker
  module Cmd
    class ConfigureTestEnv < Gemaker::Cmd::Base
      def perform
        copy_template("spec_helper.rb", "spec/spec_helper.rb", config: @config)
        create_dir("spec/support")
        copy_file("Guardfile", "Guardfile")
        puts "Configure Rspec"
      end
    end
  end
end
