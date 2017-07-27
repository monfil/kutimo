class VulgarityController < ApplicationController

	def add
		p "*** VULGARITY"
		p current_user
		p Vulgarity.all
		p user_vulgarity = Vulgarity.find_by(user_id: current_user.id) #current_user.vulgarity
		p user_vulgarity.increment!(:count)
		p user_vulgarity.update(amount: user_vulgarity.count * 5)
		flash[:success] = "You have commited #{user_vulgarity.count} fouls and now, you have to pay $ #{user_vulgarity.amount}"
		redirect_to current_user
	end

end
