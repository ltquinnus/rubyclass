module SessionsHelper
	def login(user)
		session[:user_id]=user.id
	end
	def current_user
		uid = session[:user_id]
		user ||= User.find_by(id: uid)
	end
	def logged_in?
		!session[:user_id].nil?
	end
	def logout
		session.delete(:user_id)
		@user = nil
	end
end
