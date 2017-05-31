require 'slack-notifier'

module Sermon
  class SlackNotifier
    include Notifier

    def initialize(webhook_url, channel)
      @notifier = Slack::Notifier.new(webhook_url, channel: channel)
    end

    def notify(message)
      @notifier.ping message
    end
  end
end