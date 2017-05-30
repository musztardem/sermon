module Sermon
  class ConfigValidator
    attr_reader :errors

    def initialize(config)
      @config = config
      @errors = []
    end

    def valid?
    end
  end
end