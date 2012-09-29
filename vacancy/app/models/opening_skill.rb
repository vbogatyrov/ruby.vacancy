class OpeningSkill < ActiveRecord::Base
  self.table_name = 'opening_skill'
  attr_accessible :opening_id, :skill_id
  
  belongs_to :opening
  belongs_to :skill
end
