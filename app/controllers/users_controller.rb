class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :admin_user,     only: :destroy
  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
       respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @user }
        end
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        sign_in @user
        respond_to do |format|
          format.html {redirect_to @user}
          format.json { render json: @user }
        end
    else
      render 'edit'
    end
  end

   def show
     @user = User.find(params[:id])
     respond_to do |format|
          format.html {redirect_to @user}
          format.json { render json: @user }
        end
  end

  def edit
    @user = User.find(params[:id])
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
