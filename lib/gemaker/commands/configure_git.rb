module Gemaker
  module Cmd
    class ConfigureGit < Gemaker::Cmd::Base
      def in_normal_context
        remove_in_gem(".git")
        do_initial_commit
      end

      def in_engine_context
        copy_file("engine/gitignore", ".gitignore")
        do_initial_commit
      end

      private

      def do_initial_commit
        execute_in_gem("git init")
        execute_in_gem("bundle install")
        execute_in_gem("git add .")
        execute_in_gem("git commit -m 'Initial commit'")
      end
    end
  end
end
