require "sermon/version"
require "fileutils"
require "config/config_validator"
require "config/config_processor"
require "notifiers/notifier"
require "notifiers/mail_notifier"
require "measurements/base_measure"
require "measurements/free_space"
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

  def self.start
  end
end
