class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
    	t.string :goal

      t.timestamps
    end
  end
end
