class CreateMen < ActiveRecord::Migration
  def change
    create_table :men do |t|

      t.timestamps
    end
  end
end
