class AddDefaultGroupToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :users, :group_id, 1
  end
end
