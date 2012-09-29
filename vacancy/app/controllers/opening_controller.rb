class OpeningController < ApplicationController
  def index
      @allOpening = Opening.find(:all , :order => "id")
  end

  def new
    
  end

  def show
    @opening = Opening.find(params[:id])
  end
  
  def update   
    @opening = Opening.find(params[:id])
    @opening.update_attributes(params[:opening])
    
    if @opening.valid?
      redirect_to :action => 'index'
    else
      render :template => "opening/show"
    end
  end
  
  def opening_rem_skill
    render :text => "var z = document.getElementById(\"skill#{params[:skill_id]}\"); z.parentNode.removeChild(z);"
  end
end
