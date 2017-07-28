class RemoveGroupFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_index :users, :group_id
  	remove_column :users, :group_id
  end
end
