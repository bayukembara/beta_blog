class UsersController < ApplicationController
before_action :set_user, only: %i[show edit update destroy]

  def index

  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        flash[:notice] = "User #{@user.username} was created successfully"
        redirect_to root_path
    else
        render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
