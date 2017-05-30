require 'mail'

module Sermon
  class MailNotifier
    include Notifier

    def initialize(emails_list)
      @emails_list = emails_list
      Mail.defaults do
        delivery_method :sendmail
      end
    end

    def notify(message)
      @emails_list.each do |email|
        Mail.new do
          from    'server@monitoring.com'
          to      email
          subject 'Sermon alert!'
          body    message
        end.deliver!
      end
    end
  end
end