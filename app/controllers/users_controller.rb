class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :destroy]
  before_filter :admin_user,     only: :destroy
  def new
  	@user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        sign_in @user
        @info = { status: 1, info: "create successfull"}.to_json
        format.html { redirect_to @user, notice: 'Event was successfully created.' }
        format.json { render json: @info, status: :created, location: @event }
      else
        @info = { status: 0, info: "not create successfull"}.to_json
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        sign_in @user
      @info = { status: 1, info: "update successfull"}.to_json
       respond_to do |format|
          format.html {redirect_to @user}
          format.json { render json: @info }
        end
    else
      render 'edit'
      @info = { status: 0, info: "not update successfull"}.to_json
       respond_to do |format|
          format.html {redirect_to @user}
          format.json { render json: @info }
        end
    end
  end

  def show
    binding.pry
     @user = User.find(params[:id])

     respond_to do |format|
      if @user == nil

        flash.now[:error] = 'Not user'
        @info ={status: 0 ,info:'not user'}.to_json
        format.html {  }
        format.json { render json: @info }
      else
        format.html 
        format.json { render json: @user }
     end
   end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user 
        @info = { status: 1, info: "Not my profile"}.to_json
        respond_to do |format|
          format.html { redirect_to home_path, notice: "This is not my profile"}
          format.json { render json: @info }
        end
    end
  end

  def index
      @users = User.paginate(page: params[:page])
      respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @users }
        end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  def delete
  end
   private
    def admin_user
      redirect_to(home_path) unless current_user.admin?
    end
end
