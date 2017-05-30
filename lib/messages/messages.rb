module Sermon
  module Messages
    def self.config_processor_execution_aborted
      'Execution aborted; following errors were detected: '
    end

    def self.validator_checks_existence
      'At least one check should be contained in config'
    end

    def self.validator_checks_notifiers
      'At least one notification channel should be contained in config'
    end

    def self.validator_webhook_url
      'Webhook URL should be specified'
    end

    def self.validator_free_space
      'free_space should get key/value collection'
    end

    def self.validator_emails
      'Emails key should get list of emails (Array)'
    end
  end
end