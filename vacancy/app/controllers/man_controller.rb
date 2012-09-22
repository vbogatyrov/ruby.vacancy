class ManController < ApplicationController
  def index
    @allMen = Man.find(:all , :order => "id")
  end

  def create
    Man.new(params[:man]).save
    redirect_to :action => 'index'
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
