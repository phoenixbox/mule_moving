require "rails_helper"

describe MailSender do
  describe "#confirmation" do
    let(:mail_client) { double("mail client") }

    before do
      allow(mail_client).to receive(:deliver)
    end

    subject { MailSender.new(mail_client) }

    it "sends an email to the correct place outside of test environment" do
      allow(Rails.env).to receive(:test?).and_return(false)

      subject.confirmation("customer@example.com", "Boulder", "Denver", Date.parse("31/12/2014"), "Mafia Movers")

      body = "Hi! We're waiting on confirmation from Mafia Movers for your move from Boulder to Denver on Dec 31, 2014. Expect to hear from us within 24 hours. If you have any questions, feel free to reply to this email."
      expect(mail_client).to have_received(:deliver).with({
                                                            from: "team@mulemoving.com",
                                                            to: "customer@example.com",
                                                            bcc: "team@mulemoving.com",
                                                            subject: "Mule Moving: Got it!",
                                                            text_body: body
                                                          })
    end

    it "does not send the email if in test or development" do
      subject.confirmation("customer@example.com", "Boulder", "Denver", Date.parse("31/12/2014"), "Mafia Movers")
      expect(mail_client).to_not have_received(:deliver)

      allow(Rails.env).to receive(:development?).and_return(true)

      subject.confirmation("customer@example.com", "Boulder", "Denver", Date.parse("31/12/2014"), "Mafia Movers")
      expect(mail_client).to_not have_received(:deliver)
    end
  end
end