class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log the user in and redirect to the user's show page.
  		log_in user
  		redirect_to current_user
  	else
  		# Create an error message.
  		flash.now[:danger] = 'Invalid email/password combination'
	  	render 'new'
  	end
  end

  def destroy
    p "**** Logged in" if logged_in?
    p "****** Dentro de destroy"
  	log_out # if logged_in?
    redirect_to root_url
  end

end
