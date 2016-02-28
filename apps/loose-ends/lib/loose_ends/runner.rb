require 'yaml'

module LooseEnds
  class Runner
    def run
      config_loc = File.expand_path("~/.loose-ends/config.yml")
      unless File.exists?(config_loc)
        $stderr.puts "Error: no config file found at #{config_loc}"
        exit! 123
      end

      config = YAML.load_file(config_loc)

      checkers = expand_paths_array(config[:git_dirs] || []).map { |dir|
        GitRepoChecker.new(dir, nil)
      } + expand_paths_array(config[:inbox_dirs] || []).map { |dir|
        IncomingDirChecker.new(dir, nil)
      }

      issues = checkers.map { |checker| checker.check }

      issues.each do |msg|
        puts msg
      end
    end

    private

    def expand_paths_array(paths)
      paths.flat_map { |dirspec|
        Dir[File.expand_path(dirspec)]
      }
    end
  end
end
