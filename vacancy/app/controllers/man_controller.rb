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
    @skillsToAdd = @man.skills_i_dont_have.collect {|skill| [ skill.name, skill.id ]}
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
    @skill = Skill.find(params[:skill_id])

    #render :nothing => true
    #render :text => "alert(\"callback\");"
  end
  
  def add_skill
    if params[:skill_id]
      @skill = Skill.find(params[:skill_id])
    else
      @skill = Skill.new()
      @skill.name = params[:skill_name]
      @skill.save
    end

    newManSkill = ManSkill.new()
    newManSkill.man_id   = params[:id].to_i
    newManSkill.skill_id = @skill.id
    newManSkill.save

    @manId = params[:id]
  end
end
