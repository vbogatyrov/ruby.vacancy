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
  
 # validates :name1, 
 #           :name2, 
 #           :name3, :presence => true, :format => { :with => /\A[А-Яа-я\s]+\z/,
 #                                                   :message => "Only russian letters allowed" }
            
 # validates :contact_info, 
 #           :presence => true, :format => {# for email /^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/,
 #                                          # for phone number /\(?\d{3}\)?[-\s.]?\d{3}[-\s.]\d{4}$/,
 #                                          :with => /^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$|\(?\d{3}\)?[-\s.]?\d{3}[-\s.]\d{4}$/,
 #                                          :message => "Email invalid"}
   
  
  has_many :man_skill
  has_many :skills, :through =>  :man_skill
  accepts_nested_attributes_for :skills
  
  def skills_i_dont_have
    Skill.find_by_sql("SELECT *  FROM skill WHERE id NOT IN (SELECT skill_id FROM man_skill WHERE man_id = #{@attributes['id']})")
  end
  
  def openings(exactMatch = true)
    skill_ids = skills.any? ? skills.map(&:id).join(',') : '0'
    Opening.find_by_sql("SELECT opening.id, opening.name, opening.salary, COUNT(os.skill_id) FROM opening
                           INNER JOIN opening_skill AS os ON opening.id = os.opening_id
                         WHERE (os.skill_id IN (#{skill_ids}))
                           AND DATE(now()) <= DATE(opening.actual_till)
                         GROUP BY opening.id, opening.name, opening.salary
                         HAVING COUNT(os.skill_id) #{exactMatch ? '=' : '!='} (SELECT COUNT(*) FROM opening_skill WHERE opening_skill.opening_id = opening.id)
                         ORDER BY opening.salary DESC")
  end
  
  
  
end
