class AddUserRefrenceToCharges2 < ActiveRecord::Migration[5.2]
  def change
    add_reference :charges, :user, index: true, foreign_key: true
  end
end
