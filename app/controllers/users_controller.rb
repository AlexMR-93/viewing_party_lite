class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parties = @user.view_party_status
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to(user_path(@user.id))
    else
      flash[:alert] = @user.errors.full_messages.to_s
      redirect_to(register_path)
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
