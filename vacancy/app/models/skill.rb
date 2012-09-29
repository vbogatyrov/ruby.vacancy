class Skill < ActiveRecord::Base
  self.table_name = 'skill'
  attr_accessible :id, :name
  
  has_many :man_skill

  has_many :man,     :through => :man_skill
  has_many :opening, :through => :opening_skill
end
