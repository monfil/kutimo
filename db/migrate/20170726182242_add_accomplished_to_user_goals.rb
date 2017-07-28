class AddAccomplishedToUserGoals < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_goals, :accomplished, :boolean, :default => false
  end
end
