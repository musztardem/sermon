require "sermon/version"
require "fileutils"
require "config/config_validator"
require "config/config_processor"
require "notifiers/notifier"
require "notifiers/slack_notifier"
require "notifiers/mail_notifier"
require "measurements/base_measure"
require "measurements/free_space"
require "measurements/free_mem"
require "measurements/ping"
require "sermon/constants"

module Sermon

  CONFIG_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'config', 'sermon.yml'))
  TARGET_PATH = File.expand_path('~/.sermon.yml')

  def self.setup
    FileUtils.cp(CONFIG_PATH, TARGET_PATH)

    puts "Config file was copied to #{TARGET_PATH}."
    puts 'Edit it accordingly to your needs.'
  end

  def self.check_for_config_file
    unless Pathname.new(TARGET_PATH).exist?
      puts "Config file not found."
      puts "Run sermon --setup"
      exit
    end
  end

  def self.process_config
    config = YAML.load_file(TARGET_PATH)
    config_processor = Sermon::ConfigProcessor.new(config)
    config_processor.process
    return config_processor.checks, config_processor.notifiers
  end

  def self.prepare_error_message(errors)
    return nil if errors.empty?
    error_message = "Sermon detected following issues: \n"
    errors.flatten.each do |err|
      error_message << "\t#{err}\n"
    end
    error_message
  end

  def self.start
    check_for_config_file
    checks, notifiers = process_config

    errors = []
    checks.each do |check|
      check.perform_measurement
      errors << check.errors if check.errors.any?
    end

    error_message = prepare_error_message(errors)

    notifiers.each do |notifier|
      notifier.notify error_message if error_message
    end
  end
end
