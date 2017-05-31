require 'net/ping'

module Sermon
  class Ping
    include BaseMeasure
    attr_reader :errors

    def initialize(addrs)
      @addrs = addrs
      @errors = []
    end

    def perform_measurement
      @addrs.each do |addr|
        p = Net::Ping::External.new(addr)
        @errors << Messages.ping_error(addr) unless p.ping?
      end
    end
  end
end
