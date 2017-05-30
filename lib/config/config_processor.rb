require 'yaml'
require 'colorize'

module Sermon
  class ConfigProcessor
    attr_reader :checks
    attr_reader :notifiers

    def initialize(config_path)
      @config = YAML.load_file(config_path)
      @checks = []
      @notifiers = []
    end

    def process
      config_validator = ConfigValidator.new(@config)

      if config_validator.valid?
        collect_notifiers
        collect_measuring_tools
      else
        puts 'Execution aborted; following errors were detected: '
        config_validator.errors.each do |err|
          puts "\t#{err}".red
        end
        exit 1
      end
    end

    private

    def collect_notifiers
      @notifiers << MailNotifier.new(@config['emails']) if @config['emails']
      @notifiers << SlackNotifier.new(
        @config['slack']['webhook_url'],
        @config['slack']['channel']
      ) if @config['slack']
    end

    def collect_measuring_tools
      @checks << Ping.new(@config['ping']) if @config['ping']
      @checks << FreeSpace.new(@config['free_space']) if @config['free_space']
      @checks << FreeMem.new(@config['free_mem']) if @config['free_mem']
    end
  end
end