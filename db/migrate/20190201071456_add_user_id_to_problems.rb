class AddUserIdToProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :user_id, :integer
  end
end