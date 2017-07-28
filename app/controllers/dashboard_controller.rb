class DashboardController < ApplicationController

	def show
		@all_users = User.all
		@all_vulgarities = []
		@all_rewards = []
		@all_goals = []
		@user_usergoals = []
		@all_dailyrecords  = []

		@all_users.each do |user|
			@all_vulgarities << user.vulgarity
			@all_rewards << user.rewards
			@all_goals << user.goals
			@user_usergoals << user.user_goals
		end

		

		@user_usergoals.each do |goals_array|
		p "*** EVALUANDO user_usergoals"
		p goals_array
		goals_array.each do |goal|
			@all_dailyrecords << goal.daily_records			
		end
	end

		render 'dashboard'
	end
end
