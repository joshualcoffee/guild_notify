class Guildy < ActiveRecord::Base
  attr_accessible :backup, :name, :number

  

  def self.send_to_all
    Guildy.all.each do |guildy|
      guildy.send_text_message
    end
  end


  
  def send_text_message
    number_to_send_to = self.number
  
    
  
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
  
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "YO! #{self.name} We will be raiding in 30 minutes.  If you will be late please respond with your ETA. <3 you"
    )
  end

end
