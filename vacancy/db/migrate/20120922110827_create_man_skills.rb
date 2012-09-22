class CreateManSkills < ActiveRecord::Migration
  def change
    create_table :man_skills do |t|

      t.timestamps
    end
  end
end
