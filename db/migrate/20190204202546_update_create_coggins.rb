class UpdateCreateCoggins < ActiveRecord::Migration[5.2]
  def change
    create_table :coggins do |t|
      t.belongs_to :horse
      t.string :attachment

      t.timestamps
    end
  end
end
