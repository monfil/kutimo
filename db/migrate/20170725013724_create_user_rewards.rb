class CreateUserRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_rewards do |t|
    	t.references :user, index: true
    	t.references :reward, index: true

      t.timestamps
    end
  end
end
