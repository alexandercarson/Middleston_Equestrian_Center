class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.belongs_to :horse
      t.date :date, null: false
      t.string :description, null: false
      t.string :amount, null: false
    end
  end
end
