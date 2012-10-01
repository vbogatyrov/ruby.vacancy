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
  
  def men(exactMatch = false)
    skill_ids = skills.any? ? skills.map(&:id).join(',') : '0'
    Man.find_by_sql("SELECT man.id, man.name1, man.desired_salary, COUNT(ms.skill_id) FROM man
                       INNER JOIN man_skill AS ms ON man.id = ms.man_id
                       WHERE (ms.skill_id IN (#{skill_ids}))
                         AND man.seek_employment IS true
                    GROUP BY man.id, man.name1, man.desired_salary
                      HAVING COUNT(ms.skill_id) #{exactMatch ? '=' : '!='} (SELECT COUNT(*) FROM man_skill WHERE man_skill.man_id = man.id)
                    ORDER BY man.desired_salary ASC")
  end
end
