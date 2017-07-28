class GoalsController < ApplicationController

	def goals_options
	end

	def user_goals
		@user_goals = current_user.goals
		render 'goals_options'
	end

	def destroy
		p "*** DESTROY GOAL ***"
		p params
		p user_goal = UserGoal.find_by(user_id: params[:user_id], goal_id: params[:goal_id])
		p @goal_id = params[:goal_id]
		user_goal.destroy
	end


end