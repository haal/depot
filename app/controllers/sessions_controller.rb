class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    #there is no users in db - allow crete on login
    if User.count.zero?
      user = User.create(:name => params[:name], :password => params[:password], :password_confirmation => params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    #regular case
  	elsif user = User.authenticate(params[:name], params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, :alert => 'Invalid user/password combination'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, :notice => 'Logged out'
  end
end
