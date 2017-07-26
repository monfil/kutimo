class CreateUserGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :user_goals do |t|
    	t.references :user, index: true
    	t.references :goal, index: true

      t.timestamps
    end
  end
end
