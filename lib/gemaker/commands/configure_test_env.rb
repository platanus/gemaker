module Gemaker
  module Cmd
    class ConfigureTestEnv < Gemaker::Cmd::Base
      def in_normal_context
        copy_template("normal/spec_helper.rb", "spec/spec_helper.rb", config: @config)
        copy_file("test_helpers.rb", "spec/support/test_helpers.rb")
        copy_template("normal/test_example.rb", "spec/#{@config.gem_name}_spec.rb", config: @config)
        copy_file("normal/Guardfile", "Guardfile")
        info "Configure Rspec"
      end

      def in_engine_context
        copy_template("engine/spec_helper.rb", "spec/spec_helper.rb", config: @config)
        copy_template("engine/rails_helper.rb", "spec/rails_helper.rb", config: @config)
        copy_template(
          "engine/test_example.rb",
          "spec/#{@config.gem_name}_spec.rb",
          config: @config
        )
        create_dir("spec/factories")
        copy_file("test_helpers.rb", "spec/support/test_helpers.rb")
        copy_file("image.png", "spec/fixtures/files/image.png")
        copy_file("video.mp4", "spec/fixtures/files/video.mp4")
        copy_file("engine/rspec", ".rspec")
        copy_file("engine/Guardfile", "Guardfile")
        info "Configure Rspec"
      end
    end
  end
end
