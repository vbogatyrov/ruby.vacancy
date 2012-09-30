class OpeningController < ApplicationController
  def index
      @allOpening = Opening.find(:all , :order => "id")
  end
  
  def create
    @opening = Opening.new(params[:opening])
    if @opening.add_date == nil
      @opening.add_date = Date.today
    end
    @opening.save
        
    if @opening.valid?
      redirect_to :action => 'index'
    else 
      render :template => "opening/new"
    end
  end

  def new
    @opening = Opening.new
  end

  def show
    @opening = Opening.find(params[:id])
    @skillsToAdd = Skill.find_by_sql("SELECT *  FROM skill WHERE id NOT IN (SELECT skill_id FROM opening_skill WHERE opening_id = #{@opening.id})")
    @skillsToAdd = @skillsToAdd.collect {|c| [ c.name, c.id ]}
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
  
  
  def rem_skill
    OpeningSkill.delete_all(["opening_id = ? AND skill_id = ?", params[:id], params[:skill_id]])
    @skill = Skill.find(params[:skill_id])
  end
  
  
  def add_skill
    if params[:skill_id]
      @skill = Skill.find(params[:skill_id])
    else
      @skill = Skill.new()
      @skill.name = params[:skill_name]
      @skill.save
    end
      
    newOpeningSkill = OpeningSkill.new()
    newOpeningSkill.opening_id   = params[:id].to_i
    newOpeningSkill.skill_id = @skill.id
    newOpeningSkill.save

    @openingId = params[:id]
  end
end
