class AddReceivedToUserRewards < ActiveRecord::Migration[5.0]
  def change
		add_column :user_rewards, :received, :boolean, :default => false
  end
end
