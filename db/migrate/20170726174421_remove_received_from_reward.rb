class RemoveReceivedFromReward < ActiveRecord::Migration[5.1]
  def change
  	remove_column :rewards, :received
  end
end
