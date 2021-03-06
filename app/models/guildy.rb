class Guildy < ActiveRecord::Base
  attr_accessible :backup, :name, :number
  has_and_belongs_to_many :events

  validates :number, :phony_plausible => true, :length => { :minimum => 10, :maximum =>10 }, :uniqueness => true
  

  def send_text_message(event)
    number_to_send_to = self.number
  
    @twilio_client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']
  
    @twilio_client.account.sms.messages.create(
      :from => "+1#{ENV['twilio_number']}",
      :to => number_to_send_to,
      :body => "YO! #{self.name} We will be raiding in 30 minutes.  If you will be late please respond with your ETA. <3 you"
    )
    guildy = Guildy.find_by_number(number.gsub("+1", ""))

    Message.create(:message => "awaiting response", :guildy_id =>guildy.id , :event_id => event.id)
  end

end
