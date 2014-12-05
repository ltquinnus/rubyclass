class SessionsController < ApplicationController
  def new
  end
  def create
  	email = params[:session] [:email].downcase
  	password = params[:session] [:password]
  	user = User.find_by(email: email)
  	if user && user.authenticate(password)
  		login user
  		redirect_to user
  	else
  		#show errors
  		render 'new'
  	end
  end
  def destroy
  	logout
  	redirect_to root_url
  end
end
