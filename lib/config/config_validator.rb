require 'sermon/constants'

module Sermon
  class ConfigValidator
    attr_reader :errors

    def initialize(config)
      @config = config
      @errors = []
      validate
    end

    def valid?
      @errors.empty?
    end

    private

    def validate
      verify_checks_existence
      verify_notifiations_existence
      verify_webhook_url
      verify_free_space_format
      verify_emails_format
    end

    def verify_checks_existence
      @errors << Messages.validator_checks_existence if
        (Sermon::CHECKS & @config.keys).empty?
    end

    def verify_notifiations_existence
      @errors << Messages.validator_checks_notifiers if
        (Sermon::NOTIFIERS & @config.keys).empty?
    end

    def verify_webhook_url
      @errors << Messages.validator_webhook_url if
        @config['slack'] && @config['slack']['webhook_url'].nil?
    end

    def verify_free_space_format
      @errors << Messages.validator_free_space if
        @config['free_space'] && @config['free_space'].class != Hash
    end

    def verify_emails_format
      @errors << Messages.validator_emails if
        @config['emails'] && @config['emails'].class != Array
    end
  end
end