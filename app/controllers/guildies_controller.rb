class GuildiesController < ApplicationController
  def index

  end

  def create
    @guildy = Guildy.new(params[:guildy])
    
    if @guildy.save 
      redirect_to "/success"
    else
      redirect_to "/", :flash => { :error => "Your form contained errors please check the number you entered.  If you have registered before you will not need to register again." }
    end
    
  end


end
