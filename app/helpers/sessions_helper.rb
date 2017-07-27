module SessionsHelper
	# Logs in the given user.
	def log_in(user)
		p "Evaluando sesión"
		p session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		p "*** SALIENDO DE APLICACION "
		# session.delete(:user_id)
		# session[:user_id] = nil
		reset_session
		p @current_user = nil
	end

end