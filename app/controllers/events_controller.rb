class EventsController < ApplicationController

  def index
    @event = Event.last
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to "/"
    end
  end
end
