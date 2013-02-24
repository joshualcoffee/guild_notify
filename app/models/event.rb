class Event < ActiveRecord::Base
  attr_accessible :name, :guildy_ids
  has_and_belongs_to_many :guildies
  has_many :messages

  after_create :send_sms

  def send_sms
    self.guildies.each do |guildy|
      guildy.send_text_message(self)
    end
  end


  
  
end
