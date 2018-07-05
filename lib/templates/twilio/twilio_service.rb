module TwilioService
  extend self

  def send_text_message(phone_to, message)
    client = Twilio::REST::Client.new
    client.messages.create(
      from: ENV['TWILIO_PHONE_FROM'],
      to: phone_to,
      body: message
    )
    @logger.info { "Sent SMS to #{phone_to}." }
  rescue Twilio::REST::RequestError => err
    @logger.error do
      "ERROR in Twilio call for sending message to number #{phone_to}. Error: #{err.message}"
    end
  end

  def logger
    @logger ||= Rails.logger
  end
end
