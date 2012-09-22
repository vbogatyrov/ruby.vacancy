class ManSkill < ActiveRecord::Base
  self.table_name = 'man_skill'
  attr_accessible :man_id, :skill_id
  
  belongs_to :man
  belongs_to :skill
end
