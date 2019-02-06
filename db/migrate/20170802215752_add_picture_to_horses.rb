class AddPictureToHorses < ActiveRecord::Migration[5.1]
  def change
    add_column :horses, :picture, :string
  end
end
