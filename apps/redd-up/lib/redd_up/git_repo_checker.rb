module ReddUp
  class GitRepoChecker
    def initialize(repo_path, obj)
      @repo_path = repo_path
      @obj = obj
    end

    def check

      is_valid, msg = check_valid

      if is_valid
        check_stash +
          check_branches +
          check_dirty
      else
        [Error.new(msg)]
      end

    end

    def check_valid
      if File.directory?(@repo_path)
        if File.directory?(File.join(@repo_path, ".git"))
          [true, nil]
        else
          [false, "#{@repo_path} is not a git repository"]
        end
      else
        [false, "#{@repo_path} is not a directory"]
      end
    end

    def check_stash
      git_cmd("stash list").split("\n").map do |stash|
        Info.new("stash in #{@repo_path}: #{stash}")
      end
    end

    def check_branches
      branches = git_cmd("branch --list").split("\n").map(&:strip)
      branches.map do |branch|
        branch = filter_current_asterisk branch
        num = num_remote_branches_containing branch
        if num == 0
          Info.new("#{@repo_path}: branch not pushed: #{branch}")
        end
      end.compact
    end

    def check_dirty
      it = git_dirty_or_untracked

      [
        it.untracked > 0 && Info.new("#{@repo_path}: untracked files (#{it.untracked})"),
        it.unstaged > 0 && Info.new("#{@repo_path}: unstaged changes (#{it.unstaged})"),
        it.staged > 0 && Info.new("#{@repo_path}: staged, uncommitted changes (#{it.staged})")
      ].select { |it| it != false}

    end

    def num_remote_branches_containing branch
      git_cmd("branch -r --contains #{branch} --no-color").split("\n").count
    end

    def filter_current_asterisk branch
      if match_data = branch.match(/\* (.*)/)
        match_data[1]
      else
        branch
      end
    end

    def git_cmd rest
      `cd #{@repo_path}; git #{rest}`
    end

    def git_dirty_or_untracked
      @git_dirty_or_untracked ||= GitDirtyOrUntracked.new(@repo_path)
    end
    class GitDirtyOrUntracked < Struct.new(:repo_path)
      def output
        @output ||= `cd #{repo_path}; git status --porcelain`
      end
      def parsed
        unless @parsed
          @parsed = output.split("\n").map do |line|
            line.split
          end.reject { |l| l.length == 0 }
        end
        @parsed
      end

      def staged
        number_with_first_as "A"
      end

      def unstaged
        number_with_first_as "M"
      end

      def untracked
        number_with_first_as "??"
      end

      def number_with_first_as first_value
        parsed.select do |line|
          line.first == first_value
        end.length
      end
    end
  end
end
