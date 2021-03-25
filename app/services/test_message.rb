# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC7047aea5db091917c6dc2afde40b0095'
auth_token = 'be771b0af44eeee015f1b2dc8bccc237'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19022018347' # Your Twilio number
to = '+16132970373' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey Sexy!"
)