class GuildiesController < ApplicationController
  def index

  end

  def create
    @guildy = Guildy.new(params[:guildy])
    
    if @guildy.save 
      redirect_to "/"
    end
    
  end
end
