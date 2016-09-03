module Gemaker
  module Cmd
    class ConfigureGit < Gemaker::Cmd::Base
      def perform
        remove_in_gem(".git") unless @config.engine?
        execute_in_gem("git init")
        execute_in_gem("bundle install")
        execute_in_gem("git add .")
        execute_in_gem("git commit -m 'Initial commit'")
      end
    end
  end
end
