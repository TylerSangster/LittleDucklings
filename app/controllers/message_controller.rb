class MessageController < ApplicationController 
  skip_before_action :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"

  def confirm_reply
    binding.pry
    message_body = params["Body"].downcase()
    from_number = params["From"]
    parent = Parent.where(phone_primary: from_number).first
    if message_body.include? "confirm"
      TwilioTextMessenger.new(from_number,"Hello there, thanks for texting me. Your number is #{from_number}.").call
    # boot_twilio
    # sms = @client.messages.create(
    #   from: Rails.application.credentials.twilio_number,
    #   to: from_number,
    #   body: 
    # )
    else
    end


  end

  private

  # def boot_twilio
  #   account_sid = Rails.application.credentials.twilio_sid
  #   auth_token = Rails.application.credentials.twilio_token
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  # end
end