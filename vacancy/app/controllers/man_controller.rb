class ManController < ApplicationController
  def index
    @allMen = Man.find(:all , :order => "id")
  end

  def create
    @man = Man.new(params[:man])
    @man.save
    if @man.valid?
      redirect_to :action => 'index'
    end
  end

  def new
   @man = Man.new
  end

  def show
    @person = Man.find(params[:id])
  end

  def edit
  end
  
  def update
    man = Man.find(params[:id])
    man.update_attributes(params[:man])
 
    redirect_to :action => 'index'
  end
end
