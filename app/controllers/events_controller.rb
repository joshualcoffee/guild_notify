class EventsController < ApplicationController

  def index
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to "/"
    end
  end
end
