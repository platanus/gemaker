module Gemaker
  module Cmd
    class ConfigureTestEnv < Gemaker::Cmd::Base
      def in_normal_context
        copy_template("normal/spec_helper.rb", "spec/spec_helper.rb", config: @config)
        create_dir("spec/support")
        copy_file("normal/Guardfile", "Guardfile")
        puts "Configure Rspec"
      end
    end
  end
end
