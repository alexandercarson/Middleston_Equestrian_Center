class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.integer :horse_id
      t.integer :problem_id

      t.timestamps
    end
  end
end
