module LooseEnds
  class IncomingDirChecker
    attr_accessor :incoming_path

    def initialize(incoming_path, obj)
      @incoming_path = incoming_path
      @obj = obj
    end

    def check
      Dir.chdir(File.expand_path @incoming_path) do
        content = Dir["*"]

        if content.count > 0
          Info.new("#{@incoming_path}: #{content.count} files")
        end
      end
    end
  end
end
