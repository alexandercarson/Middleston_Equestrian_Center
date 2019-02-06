class Medications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.belongs_to :horse
      t.string :medication_name
      t.string :medication_for
      t.string :medication_time
      t.string :medication_day
      t.string :medication_frequency
      t.string :medication_dosage
      t.text :medication_notes
    end
  end
end
