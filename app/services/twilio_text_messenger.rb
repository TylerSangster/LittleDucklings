class TwilioTextMessenger
  attr_reader :message

  def initialize(phone,message)
    @message = message
    @phone = phone
  end

  def call
    client = Twilio::REST::Client.new(Rails.application.credentials.twilio_account_sid, Rails.application.credentials.twilio_auth_token)
    client.messages.create({
      from: Rails.application.credentials.twilio_phone_number,
      to: @phone,
      body: @message
    })
  end
end