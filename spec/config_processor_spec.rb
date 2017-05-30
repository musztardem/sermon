require "spec_helper"
require 'pry'

RSpec.describe Sermon::ConfigProcessor do
  describe "#process" do
    let(:config_mail_and_free_space) { build :config, :valid_mail_and_free_space }

    it "should return #{described_class} with MailNotifier and FreeMem" do
      klass = described_class.new(config_mail_and_free_space)
      klass.process
      expect(klass.checks.size).to eq 1
      expect(klass.notifiers.size).to eq 1
      expect(klass.checks.first).to be_instance_of Sermon::FreeSpace
      expect(klass.notifiers.first).to be_instance_of Sermon::MailNotifier
    end
  end
end