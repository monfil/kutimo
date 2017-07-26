class AddOwnerToGroups < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :owner, :integer
  end
end
