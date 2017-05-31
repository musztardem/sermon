module Sermon
  module BaseRegister
    class InvalidRegister < StandardError; end

    def add(_tool)
      raise NotImplementedError
    end
  end
end
