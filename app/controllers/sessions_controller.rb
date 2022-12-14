class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(    email: params[:email])
    session[:user_id] = user.id

    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to("/users/#{user.id}")
    else
      flash[:error] = "Bad Credentials, try again."
      redirect_to("/login")
    end
  end

  def destroy
    session.destroy
    redirect_to("/login")
  end
end
