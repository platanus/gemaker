module Gemaker
  module Cmd
    class ExecuteGitInit < Gemaker::Cmd::Base
      def perform
        rm_rf(".git")
        execute("git init")
        execute("git add .")
        execute("git commit -m 'Initial commit'")
      end
    end
  end
end
