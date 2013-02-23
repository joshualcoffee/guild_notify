class Guildy < ActiveRecord::Base
  attr_accessible :backup, :name, :number
  has_and_belongs_to_many :events

  

  def send_text_message
    number_to_send_to = self.number
  
    @twilio_client = Twilio::REST::Client.new Twilio.twilio_sid, Twilio.twilio_token
  
    @twilio_client.account.sms.messages.create(
      :from => "+1#{Twilio.twilio_phone_number}",
      :to => number_to_send_to,
      :body => "YO! #{self.name} We will be raiding in 30 minutes.  If you will be late please respond with your ETA. <3 you"
    )
  end

end
