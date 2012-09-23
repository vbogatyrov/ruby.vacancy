class Man < ActiveRecord::Base
  self.table_name = 'man'
  attr_accessible :id, 
                  :name1, 
                  :name2, 
                  :name3, 
                  :contact_info, 
                  :seek_employment, 
                  :desired_salary, 
                  :skills
  
  validates :name1, 
            :name2, 
            :name3, :presence => true, :format => { :with => /\A[А-Яа-я\s]+\z/,
                                                    :message => "Only russian letters allowed" }
            
  validates :contact_info, :presence => true 
  
  has_many :man_skill
  has_many :skills, :through =>  :man_skill
  
  
  
end
