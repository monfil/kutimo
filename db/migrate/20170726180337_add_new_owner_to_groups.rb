class AddNewOwnerToGroups < ActiveRecord::Migration[5.1]
  def change
  	add_column :groups, :owner, :integer
  end
end
