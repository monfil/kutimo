class RemoveOwnerFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :owner
  end
end
