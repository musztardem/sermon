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
      @errors.empty? ? true : false
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
      @errors << 'At least one check should be contained in config' if
        (Sermon::CHECKS & @config.keys).empty?
    end

    def verify_notifiations_existence
      @errors << 'At least one notification channel should be contained in config' if
        (Sermon::NOTIFIERS & @config.keys).empty?
    end

    def verify_webhook_url
      @errors << 'Webhook URL should be specified' if
        @config['slack'] && @config['slack']['webhook_url'].nil?
    end

    def verify_free_space_format
      @errors << 'free_space should get key/value collection' if
        @config['free_space'] && @config['free_space'].class != Hash
    end

    def verify_emails_format
      @errors << 'Emails key should get list of emails (Array)' if
        @config['emails'] && @config['emails'].class != Array
    end
  end
end