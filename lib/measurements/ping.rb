require 'net/ping'

module Sermon
  class Ping
    include BaseMeasure
    attr_reader :errors

    def initialize(addr)
      @addr = addr
      @errors = []
    end

    def perform_measure
      p = Net::Ping::External.new(@addr)
      @errors << "Cannot ping address #{@addr}" unless p.ping?
    end
  end
end
