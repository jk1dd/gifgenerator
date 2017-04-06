class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = "Login failed"
      render :new
    end
  end
end
