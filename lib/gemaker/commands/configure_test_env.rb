module Gemaker
  module Cmd
    class ConfigureTestEnv < Gemaker::Cmd::Base
      def in_normal_context
        copy_template("normal/spec_helper.rb", "spec/spec_helper.rb", config: @config)
        copy_file("test_helpers.rb", "spec/support/test_helpers.rb")
        copy_template("normal/test_example.rb", "spec/#{@config.gem_name}_spec.rb", config: @config)
        copy_file("normal/Guardfile", "Guardfile")
        puts "Configure Rspec"
      end

      def in_engine_context
        copy_template("engine/spec_helper.rb", "spec/spec_helper.rb", config: @config)
        copy_template("engine/rails_helper.rb", "spec/rails_helper.rb", config: @config)
        copy_template("engine/test_example.rb",
          "spec/dummy/spec/#{@config.gem_name}_spec.rb", config: @config)
        create_dir("spec/dummy/spec/factories")
        copy_file("test_helpers.rb", "spec/dummy/spec/support/test_helpers.rb")
        copy_file("image.png", "spec/dummy/spec/assets/image.png")
        copy_file("video.mp4", "spec/dummy/spec/assets/video.mp4")
        copy_file("engine/rspec", ".rspec")
        puts "Configure Rspec"
      end
    end
  end
end
