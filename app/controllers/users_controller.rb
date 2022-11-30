class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      redirect_to(user_path(@user))
    else
      flash[:alert] = "Email Must be Unique. Please Try Again"
      redirect_to("/register")
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
