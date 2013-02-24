class GuildiesController < ApplicationController
  def index

  end

  def create
    @guildy = Guildy.new(params[:guildy])
    
    if @guildy.save 
      
    end
    
  end
end
