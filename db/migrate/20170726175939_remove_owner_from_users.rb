class RemoveOwnerFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :owner
  end
end
