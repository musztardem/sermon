require 'singleton'

module Sermon
  class NotifiersRegister
    include BaseRegister
    include Singleton
    attr_reader :register

    def initialize
      @register = []
    end

    def add(tool)
      # only for classes implementing Notifier "interface"
      raise InvalidRegister unless tool.class.ancestors.include? Notifier
      @register << tool
    end
  end
end
