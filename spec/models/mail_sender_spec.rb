require 'spec_helper'

describe MailSender do
  describe '#confirmation' do
    let(:mail_client) { double('mail client') }

    before do
      mail_client.stub(:deliver)
    end

    subject { MailSender.new(mail_client) }

    it 'sends an email to the correct place outside of test environment' do
      Rails.env.stub(:test?).and_return(false)

      subject.confirmation('customer@example.com', 'Boulder', 'Denver', Date.parse('31/12/2014'), 'Mafia Movers')

      body = 'Hi! We\'re waiting on confirmation from Mafia Movers for your move from Boulder to Denver on Dec 31, 2014. Expect to hear from us within 24 hours. If you have any questions, feel free to reply to this email.'
      expect(mail_client).to have_received(:deliver).with({
                                                            from: 'team@rawlabs.co',
                                                            to: 'customer@example.com',
                                                            bcc: 'team@rawlabs.co',
                                                            subject: 'Mule Moving: Got it!',
                                                            text_body: body
                                                          })

      Rails.env.unstub(:test?)
    end

    it 'does not send the email if in test or development' do
      subject.confirmation('customer@example.com', 'Boulder', 'Denver', Date.parse('31/12/2014'), 'Mafia Movers')
      expect(mail_client).to_not have_received(:deliver)

      Rails.env.stub(:development? => true)

      subject.confirmation('customer@example.com', 'Boulder', 'Denver', Date.parse('31/12/2014'), 'Mafia Movers')
      expect(mail_client).to_not have_received(:deliver)

      Rails.env.unstub(:development?)
    end
  end
end