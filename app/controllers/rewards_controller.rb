class RewardsController < ApplicationController

	def show
		@rewards = current_user.rewards
		params
	end

	def new
		@reward = Reward.new
	end

	def create
		@reward = Reward.new(reward_params)

		if @reward
			@reward.save
			@user_reward = UserReward.create(user_id: current_user.id, reward_id: @reward.id)
			redirect_to @reward
		else
			redirect_to new_reward_path
		end
	end

	def edit
		@reward = Reward.find(params[:id])
	end

	def update

		@reward = Reward.find(params[:id])
		if @reward.update(reward_params)
			redirect_to @reward
		else
			render 'edit'
		end
		
	end

	def destroy
		p "***** DESTROY"
		p current_user
		p params
		p @reward = UserReward.find_by(user_id: params[:user_id], reward_id: params[:reward_id])
		@reward.destroy
		redirect_to rewards_path
	end

	private
		
		def reward_params
			params.require(:reward).permit([:reward])
		end

end