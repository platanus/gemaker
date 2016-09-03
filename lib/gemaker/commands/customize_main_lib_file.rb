module Gemaker
  module Cmd
    class CustomizeMainLibFile < Gemaker::Cmd::Base
      def in_engine_context
        copy_template("engine/lib_main_file.rb", "lib/#{@config.gem_name}.rb", config: @config)
        info "Customize \"lib/#{@config.gem_name}.rb\""
      end
    end
  end
end
