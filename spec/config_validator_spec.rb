require "spec_helper"
require 'pry'

RSpec.describe Sermon::ConfigValidator do
  describe 'valid configuration' do
    let(:config) { build :config, :valid }
    let(:config_without_channel_name) { build :config, :without_channel_name }

    it 'should be valid with at least one check and communication channel' do
      expect(described_class.new(config).errors).to be_empty
    end

    it 'should be valid without channel name in slack notifier' do
      errors = described_class.new(config_without_channel_name).errors
      expect(errors).to be_empty
    end
  end

  describe 'invalid configuration' do
    let(:config_without_checks) { build :config, :without_checks }
    let(:config_without_notifiers) { build :config, :without_notifiers }

    it 'should not be valid without checks' do
      errors = described_class.new(config_without_checks).errors
      expect(errors.size).to eq 1
      expect(errors).to include 'At least one check should be contained in config'
    end

    it 'should not be valid without notifiers' do
      errors = described_class.new(config_without_notifiers).errors
      expect(errors.size).to eq 1
      expect(errors).to include 'At least one notification channel should be contained in config'
    end
  end

  describe 'invalid slack format' do
    let(:config_without_webhook_url) { build :config, :without_webhook_url }

    it 'should not be valid without webhook_url' do
      errors = described_class.new(config_without_webhook_url).errors
      expect(errors.size).to eq 1
      expect(errors).to include 'Webhook URL should be specified'
    end
  end

  describe 'invalid free_space format' do
    let(:config_without_free_space_in_hash) { build :config, :without_free_space_in_hash }

    it 'should not be valid with wrong free_space format' do
      errors = described_class.new(config_without_free_space_in_hash).errors
      expect(errors.size).to eq 1
      expect(errors).to include 'free_space should get key/value collection'
    end
  end

  describe 'invalid emails format' do
    let(:config_with_invalid_emails_format) { build :config, :with_invalid_emails_format }

    it 'should not be valid with invalid emails format' do
      errors = described_class.new(config_with_invalid_emails_format).errors
      expect(errors.size).to eq 1
      expect(errors).to include 'Emails key should get list of emails (Array)'
    end
  end
end