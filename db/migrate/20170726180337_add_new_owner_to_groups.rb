class AddNewOwnerToGroups < ActiveRecord::Migration[5.0]
  def change
  	add_column :groups, :owner, :integer
  end
end
