class AddChargeInfoToCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :description
      t.string :amount
      t.date :date
      t.string :stripe_id
      t.string :stripe_email
      t.string :stripe_token
      t.timestamps
    end
  end
end
