require 'colorize'

module Sermon
  class ConfigProcessor
    def initialize(config)
      @config = config
    end

    def process
      config_validator = ConfigValidator.new(@config)

      if config_validator.valid?
        register_notifiers
        register_measuring_tools
      else
        puts Messages.config_processor_execution_aborted
        config_validator.errors.each do |err|
          puts "\t#{err}".red
        end
        exit 1
      end
    end

    private

    def register_notifiers
      register = NotifiersRegister.instance
      register.add MailNotifier.new(@config['emails']) if @config['emails']
      if @config['slack']
        register.add SlackNotifier.new(
          @config['slack']['webhook_url'],
          @config['slack']['channel']
        )
      end
    end

    def register_measuring_tools
      register = MeasurementRegister.instance
      register.add Ping.new(@config['ping']) if @config['ping']
      register.add FreeSpace.new(@config['free_space']) if @config['free_space']
      register.add FreeMem.new(@config['free_mem']) if @config['free_mem']
    end
  end
end
