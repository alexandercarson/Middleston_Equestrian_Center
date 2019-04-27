class UpdateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.belongs_to :horse
      t.belongs_to :user

      t.string :stripe_id
      t.string :stripe_email
      t.string :stripe_token
      t.string :date
      t.string :description
      t.string :amount
      t.timestamps
    end
  end
end
