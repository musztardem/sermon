require 'spec_helper'
require 'pry'

RSpec.describe Sermon::MeasurementRegister do
  describe '#add' do
    let(:free_mem) { Sermon::FreeMem.new(256) }
    let(:mail_notifier) { Sermon::MailNotifier.new(['test@email.com']) }

    it 'should raise InvalidRegister when gets class not implementing Notifier interface' do
      expect { described_class.instance.add(mail_notifier) }
        .to raise_exception(Sermon::InvalidRegister)
    end

    it 'should accept class implementing Notifier interface' do
      expect { described_class.instance.add(free_mem) }
        .not_to raise_exception

      expect(described_class.instance.register.size).to eq 1
    end
  end
end