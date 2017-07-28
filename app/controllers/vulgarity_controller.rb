class VulgarityController < ApplicationController

	def add
		user_vulgarity = current_user.vulgarity
		user_vulgarity.increment!(:count)
		user_vulgarity.update(amount: user_vulgarity.count * 5)
		flash[:success] = "You have commited #{user_vulgarity.count} fouls and now, you have to pay $ #{user_vulgarity.amount}"
		redirect_to current_user
	end

	def reset
		user = User.find(params[:user_id])
		user_vulgarity = user.vulgarity
		user_vulgarity.update(count: 0)
		user_vulgarity.update(amount: 0)
		redirect_to current_user
	end

end
