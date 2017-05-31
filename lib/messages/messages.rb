module Sermon
  module Messages
    def self.sermon_file_copied(target_path)
      "Config file was copied to #{target_path}.\nEdit it accordingly to your needs."
    end

    def self.sermon_file_not_found
      "Config file not found.\nRun sermon --setup"
    end

    def self.sermon_detected_issues
      "Sermon detected following issues: \n"
    end

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

    def self.validator_pings
      'Ping key should get list of addresses (Array)'
    end

    def self.free_mem_error(free, min)
      "Memory usage is too high: #{free}MB available / at least #{min}MB expected"
    end

    def self.free_space_error(file, file_size, min_size)
      "Maximum #{file} size exceeded: #{file_size}MB found / at most #{min_size}MB expected"
    end

    def self.ping_error(addr)
      "Cannot ping address #{addr}"
    end
  end
end
