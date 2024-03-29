class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User #{@user.username} was created successfully"

      redirect_to login_path
    else
      render "new"
    end
    # If you want the registration id to auto login
    #   if @user.save
    #   session[:user_id] = @user_id
    #   flash[:notice] = "User #{@user.username} was created successfully"
    #   redirect_to login_path
    # else
    #   render "new"
    # end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User #{@user.username} was Edited"

      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end
end
