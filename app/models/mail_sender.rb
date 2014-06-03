class MailSender
  def initialize(client = Postmark::ApiClient.new(ENV['POSTMARK']))
    @client = client
  end

  def confirmation(customer, from, to, move_date, mover_name)
    return if Rails.env.test? || Rails.env.development?

    formatted_date = move_date.strftime("%b %d, %Y")
    body = "Hi! We're waiting on confirmation from #{mover_name} for your move from #{from} to #{to} on #{formatted_date}. Expect to hear from us within 24 hours. If you have any questions, feel free to reply to this email."
    @client.deliver({
                      from: 'team@rawlabs.co',
                      to: customer,
                      bcc: 'team@rawlabs.co',
                      subject: 'Mule Moving: Got it!',
                      text_body: body
                    })
  end
end