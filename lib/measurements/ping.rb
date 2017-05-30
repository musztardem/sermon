require 'net/ping'

module Sermon
  class Ping
    include BaseMeasure
    attr_reader :errors

    def initialize(addr)
      @addr = addr
      @errors = []
    end

    def perform_measurement
      p = Net::Ping::External.new(@addr)
      @errors << Messages.ping_error(@addr) unless p.ping?
    end
  end
end
