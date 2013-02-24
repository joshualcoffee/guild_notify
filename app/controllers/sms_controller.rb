class SmsController < ApplicationController
  def index 
      number = params[:From]
      message = params[:Body]
      guildy = Guildy.find_by_number(number.gsub("+1", ""))
      event = Event.last
      
      message = Message.where(:guildy_id => guildy.id, :event_id => event.id)
      message.update_attributes(:message => message )
      render :nothing => true
    end
end
