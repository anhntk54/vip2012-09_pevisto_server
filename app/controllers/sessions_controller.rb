class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_user(params[:session][:user])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid user/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to home_path
  end
end