class CreateHorses < ActiveRecord::Migration[5.1]
  def change
    create_table :horses do |t|
      t.string :registered_name
      t.string :barn_name, null: false
      t.string :breed, null: false
      t.string :discipline

      t.belongs_to :user, null: false
      t.belongs_to :veterinarian, null: false
      t.belongs_to :farrier, null: false
    end
  end
end
