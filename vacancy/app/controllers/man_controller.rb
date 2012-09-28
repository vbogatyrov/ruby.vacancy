class ManController < ApplicationController
  def index
    @allMen = Man.find(:all , :order => "id")
  end

  def create
    @man = Man.new(params[:man])
    @man.save
        
    if @man.valid?
      redirect_to :action => 'index'
    else 
      render :template => "man/new"
    end
  end

  def new
   @man = Man.new
  end

  def show
    @man = Man.find(params[:id])
  end

  def edit
  end
  
  def update
    @man = Man.find(params[:id])
    @man.update_attributes(params[:man])
    
    if @man.valid?
      redirect_to :action => 'index'
    else
      render :template => "man/show"
    end
  end
  
  def rem_skill
    ManSkill.delete_all(["man_id = ? AND skill_id = ?", params[:id], params[:skill_id]])
    render :text => "var z = document.getElementById(\"skill#{params[:skill_id]}\"); z.parentNode.removeChild(z);"
    #render :nothing => true
  end
end
