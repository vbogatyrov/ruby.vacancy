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
            
  validates :contact_info, 
            :presence => true, :format => {# for email /^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/,
                                           # for phone number /\(?\d{3}\)?[-\s.]?\d{3}[-\s.]\d{4}$/,
                                           :with => /^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$|\(?\d{3}\)?[-\s.]?\d{3}[-\s.]\d{4}$/,
                                           :message => "Email invalid"}
   
  
  has_many :man_skill
  has_many :skills, :through =>  :man_skill
  
  
  
end
