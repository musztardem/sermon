require 'vmstat'

module Sermon

  MB = 1024 ** 2

  class FreeMem 
    include BaseMeasure
    attr_reader :errors

    def initialize(min_size)
      @min_size = min_size
      @errors = []
    end

    def perform_measure
      memory = Vmstat.snapshot.memory
      free = (memory.free_bytes + memory.inactive_bytes) / MB
      @errors << "Memory usage is too high: #{free}MB available / #{@min_size}MB expected" if free < @min_size
    end
  end
