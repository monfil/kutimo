class CreateDailyRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_records do |t|
    	t.references :user_goal, index: true

      t.timestamps
    end
  end
end
