class SmsController < ApplicationController
  def index 
      number = params[:From]
      body = params[:Body]
      guildy = Guildy.find_by_number(number.gsub("+1", ""))
      event = Event.last
      
      message = Message.find(:all, :conditions => ['guildy_id = ? AND event_id = ?', guildy.id, event.id]).first
      message.update_attributes(:message =>  body)
      render :nothing => true
    end
end
