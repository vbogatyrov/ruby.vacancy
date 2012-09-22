class Man < ActiveRecord::Base
  self.table_name = 'man'
  
  attr_accessible :id, :name1, :name2, :name3, :contact_info, :seek_employment, :desired_salary, :skills 
  
  has_many :man_skill
  has_many :skills, :through =>  :man_skill
  
end
