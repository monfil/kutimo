class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
    	t.string :reward
    	t.boolean :received, default: false

      t.timestamps
    end
  end
end
