class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_user(params[:session][:user])
     respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        sign_in user
        @info = { status: 1, info: "signin successfull"}.to_json
        format.html { redirect_to user }
        format.json { render json: @info, status: :created, location: @event }
      else
        @info = { status: 0, info: "not signin successfull"}.to_json
        flash.now[:error] = 'Invalid user/password combination'
        format.html { render action: "new", notice: 'Invalid user/password combination' }
        format.json { render json: @info, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    sign_out
    redirect_to home_path
  end
end