class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.belongs_to :horse, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
