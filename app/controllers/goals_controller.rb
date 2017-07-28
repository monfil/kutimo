class GoalsController < ApplicationController

	def goals_options
		@all_goals = Goal.all
		@user_goals = current_user.goals
	end

	def user_goals
		@user_goals = current_user.goals
		render 'goals_options'
	end

	def new
		@new_goal = Goal.new
	end

	def create
		@goal = Goal.new(goal_params)
		if @goal.goal != ""
			@goal.save
			@user_goal = UserGoal.create(user_id: params[:user_id], goal_id: @goal.id)
			redirect_to goals_path
		else
			redirect_to new_goal_path
		end
	end

	def destroy
		user_goal = UserGoal.find_by(user_id: params[:user_id], goal_id: params[:goal_id])
		@goal_id = params[:goal_id]
		user_goal.destroy
	end

	def edit
		@goal_edit = Goal.find(params[:goal_id])
	end

	def update
		@goal = Goal.find(params[:id])
		if @goal.update(goal_params)
			redirect_to user_goals_path
		else
			render 'edit'
		end

	end

	def show_goals
		@all_goals = Goal.all
		@user_goals = current_user.goals
		render 'goals_options'
	end

	def add_goal
		add_goal = UserGoal.create(user_id: params[:user_id], goal_id: params[:goal_id])
		redirect_to goals_path	
	end

	def restart_goal_record
		user_goal = UserGoal.find_by(user_id: params[:user_id], goal_id: params[:goal_id])
		goal_daily_records = user_goal.daily_records
		goal_daily_records.delete_all
	end

	def mark_goal
		user_goal = UserGoal.find_by(user_id: params[:user_id], goal_id: params[:goal_id])
		goal_records = user_goal.daily_records
		
		if goal_records.count != 0

			goal_records.each do |record|
				p record.created_at.to_date
				if record.created_at.to_date == Date.current
					# Record already exists
					flash[:alert] = "Record already exists"
				else
					DailyRecord.create(user_goal_id: user_goal.id)
				end
			end

		else
			DailyRecord.create(user_goal_id: user_goal.id)
		end
		goal_count = user_goal.daily_records.count
		if goal_count >= 15
			user_goal.update(accomplished: true)
		end

	end

	private

		def goal_params
			params.require(:goal).permit([:goal])
		end

end