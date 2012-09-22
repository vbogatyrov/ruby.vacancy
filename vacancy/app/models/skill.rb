class Skill < ActiveRecord::Base
  self.table_name = 'skill'
  attr_accessible :name
end
