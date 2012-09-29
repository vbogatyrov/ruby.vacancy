class Opening < ActiveRecord::Base
  self.table_name = 'opening'
  attr_accessible :id,
                  :name,
                  :add_date,
                  :actual_till,
                  :salary,
                  :contact_info,
                  :skills
                  
  validates :salary, :numericality => {:only_integer => true}, :allow_nil => true
  
   
  has_many :opening_skill
  has_many :skills, :through =>  :opening_skill
  accepts_nested_attributes_for :skills
end
