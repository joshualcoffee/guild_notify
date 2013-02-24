class SmsController < ApplicationController
  def index 
      number = params[:From]
      message = params[:Body]
      guildy = Guildy.find_by_number(number.gsub("+1", ""))
      event = Event.last
      Message.create(:message => message, :guildy_id => guildy.id, :event_id => event.id )
      render :nothing => true
    end
end
