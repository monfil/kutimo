class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      Vulgarity.create(user_id: @user.id)
      flash[:success] = "Welcome to the kutimo!"
  		redirect_to signedup_path
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
  	end

end