class CreateOpeningSkills < ActiveRecord::Migration
  def change
    create_table :opening_skills do |t|

      t.timestamps
    end
  end
end
