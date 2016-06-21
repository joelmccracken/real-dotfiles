module ReddUp
  Error = Struct.new(:error) do
    def to_s
      "Error(#{error})"
    end
  end

  Warn  = Struct.new(:warn) do
    def to_s
      "Warn(#{warn})"
    end
  end

  Info  = Struct.new(:info) do
    def to_s
      "Info(#{info})"
    end
  end
end
