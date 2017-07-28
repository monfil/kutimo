class RemoveReceivedFromReward < ActiveRecord::Migration[5.0]
  def change
  	remove_column :rewards, :received
  end
end
