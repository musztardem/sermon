module Sermon
  module BaseRegister

    class InvalidRegister < StandardError; end

    def add(tool)
      raise NotImplementedError
    end
  end
end