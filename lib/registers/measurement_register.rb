require 'singleton'

module Sermon
  class MeasurementRegister
    include Singleton
    attr_reader :register

    def initialize
      @register = []
    end

    def add(tool)
      # only for classes implementing BaseMeasure "interface"
      raise InvalidRegister unless tool.class.ancestors.include? BaseMeasure
      @register << tool
    end
  end
end
