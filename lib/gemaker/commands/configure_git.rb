module Gemaker
  module Cmd
    class ConfigureGit < Gemaker::Cmd::Base
      def perform
        execute("bundle install")
        rm_rf(".git")
        execute("git init")
        execute("git add .")
        execute("git commit -m 'Initial commit'")
      end
    end
  end
end
