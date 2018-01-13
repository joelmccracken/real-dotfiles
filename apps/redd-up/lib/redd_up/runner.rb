require 'yaml'

module ReddUp
  class Runner
    def run(arguments)
      config_loc = File.expand_path("~/.redd-up/config.yml")
      unless File.exists?(config_loc)
        $stderr.puts "Error: no config file found at #{config_loc}"
        exit! 123
      end
      config = YAML.load_file(config_loc)

      case arguments.first
      when "check" then check(config)
      else check(config)
      end

    end

    private

    def expand_paths_array(paths)
      paths.flat_map { |dirspec|
        Dir[File.expand_path(dirspec)]
      }
    end

    def check(config)
      checkers = expand_paths_array(config[:git_dirs] || []).map { |dir|
        GitRepoChecker.new(dir, nil)
      } + expand_paths_array(config[:inbox_dirs] || []).map { |dir|
        IncomingDirChecker.new(dir, nil)
      }

      issues = checkers.flat_map { |checker| checker.check }.reject(&:nil?)

      config_loc = File.expand_path("~/.redd-up/cache")
      File.open(config_loc, "w+") do |f|
        issues.each do |msg|
          puts msg
          f.puts msg
        end
      end
      config_loc = File.expand_path("~/.redd-up/cache")
      File.write(File.expand_path("~/.redd-up/last-run"), DateTime.now.strftime("%I:%M %p %a %d-%m-%Y"))
    end
  end
end
