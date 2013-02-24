class Message < ActiveRecord::Base
  attr_accessible :event_id, :guildy_id, :message
  belongs_to :event
  belongs_to :guildy

  
end
