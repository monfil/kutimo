# g1 = Group.create(name: "Los Mews")

# u1 = User.create(name: "Mew", last_name: "Monfil", email: "mew@mail.com", password: "123456", group_id: g1.id)
# u2 = User.create(name: "Taki", last_name: "Hernández", email: "taki@mail.com", password: "123456", group_id: g1.id)
# u3 = User.create(name: "Viten", last_name: "Monfil", email: "viten@mail.com", password: "123456", group_id: g1.id)

# g1 = Goal.create(goal: "Lavarse los dientes después de cada comida")
# g2 = Goal.create(goal: "Bañarse antes de las 8 pm")
# g3 = Goal.create(goal: "Lavar los trastes los martes, miércoles y jueves")
# g4 = Goal.create(goal: "No usar celular después de las 8 pm")
# g5 = Goal.create(goal: "No usar celular en la mesa")
# g6 = Goal.create(goal: "Poner ropa sucia en su lugar")

# r1 = Reward.create(reward: "1 bebé")
# r2 = Reward.create(reward: "Poster")
# r3 = Reward.create(reward: "Rompecabezas")

# v1 = Vulgarity.create(user_id: u1.id)
# v2 = Vulgarity.create(user_id: u2.id)
# v3 = Vulgarity.create(user_id: u3.id)

# u1 goals
# ug1 = UserGoal.create(user_id: u1.id, goal_id: g1.id)
# ug2 = UserGoal.create(user_id: u1.id, goal_id: g4.id)
# ug3 = UserGoal.create(user_id: u1.id, goal_id: g5.id)
# # u2 goals
# ug4 = UserGoal.create(user_id: u2.id, goal_id: g2.id)
# ug5 = UserGoal.create(user_id: u2.id, goal_id: g3.id)
# ug6 = UserGoal.create(user_id: u2.id, goal_id: g4.id)
# # u3 goals
# ug7 = UserGoal.create(user_id: u3.id, goal_id: g6.id)
# ug8 = UserGoal.create(user_id: u3.id, goal_id: g5.id)
# ug9 = UserGoal.create(user_id: u3.id, goal_id: g1.id)

# ur1 = UserReward.create(user_id: u1.id, reward_id: r1.id)
# ur2 = UserReward.create(user_id: u2.id, reward_id: r2.id)
# ur3 = UserReward.create(user_id: u3.id, reward_id: r3.id)

# # u1 records
# DailyRecord.create(user_goal_id: ug1.id)
# DailyRecord.create(user_goal_id: ug1.id)
# DailyRecord.create(user_goal_id: ug1.id)
# DailyRecord.create(user_goal_id: ug1.id)
# DailyRecord.create(user_goal_id: ug1.id)
# DailyRecord.create(user_goal_id: ug2.id)
# DailyRecord.create(user_goal_id: ug2.id)
# DailyRecord.create(user_goal_id: ug3.id)
# DailyRecord.create(user_goal_id: ug3.id)
# DailyRecord.create(user_goal_id: ug3.id)
# DailyRecord.create(user_goal_id: ug3.id)
# DailyRecord.create(user_goal_id: ug3.id)
# # u2 records
# DailyRecord.create(user_goal_id: ug4.id)
# DailyRecord.create(user_goal_id: ug4.id)
# DailyRecord.create(user_goal_id: ug4.id)
# DailyRecord.create(user_goal_id: ug4.id)
# DailyRecord.create(user_goal_id: ug4.id)
# DailyRecord.create(user_goal_id: ug5.id)
# DailyRecord.create(user_goal_id: ug5.id)
# DailyRecord.create(user_goal_id: ug5.id)
# DailyRecord.create(user_goal_id: ug5.id)
# DailyRecord.create(user_goal_id: ug5.id)
# DailyRecord.create(user_goal_id: ug6.id)
# DailyRecord.create(user_goal_id: ug6.id)
# DailyRecord.create(user_goal_id: ug6.id)
# DailyRecord.create(user_goal_id: ug6.id)
# DailyRecord.create(user_goal_id: ug6.id)

# Querys
# Find an user
# u = User.find(1)
# Find a group
# gr = Group.find(1)
# Find group members
# gr.users
# User goals
# u.goals
# Find a goal
# go = Goal.find(1)
# Users with that goal
# go.users
# Find a reward
# r = Reward.find(1)
# Users with that reward
# r.users
# Find a row Vulgarity
# v = Vulgarity.find(1)
# Find Vulgarity record user
# v.user
# Vulgarity record of an user
# u.vulgarity
# user_goals of an user
# ugu1 = UserGoal.where(user_id: 1)
# Daily records of the first goal of an user
# ugu1.first.daily_records
# 
# DailyRecord.first.user_goal.user
# 

def dashboard(group_id)
	@group = Group.find(group_id)
	@group_users = @group.users
	@group_vulgarities = []
	@group_rewards = []
	@group_goals = []
	@user_usergoals = []
	@group_dailyrecords  = []
	
	@group_users.each do |user|
		@group_vulgarities << user.vulgarity
		@group_rewards << user.rewards
		@group_goals << user.goals
		@user_usergoals << user.user_goals
	end

	p "Evaluando user_usergoals"
	p @user_usergoals

	@user_usergoals.each do |goals_array|
		p "*** EVALUANDO user_usergoals"
		p goals_array
		goals_array.each do |goal|
			@group_dailyrecords << goal.daily_records			
		end
	end

	p "**** GROUP ****"
	p @group
	p "**** USERS ****"
	p @users
	p "**** GROUP VULGARITIES ****"
	p @group_vulgarities
	p "**** GROUP REWARDS ****"
	p @group_rewards
	p "**** GROUP GOALS ****"
	p @group_goals
	p "**** USER GOALS ****"
	p @user_usergoals
	p "**** GROUP DAILY RECORDS ****"
	p @group_dailyrecords
end

dashboard(1)