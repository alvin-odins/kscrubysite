class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where('username = :e OR email = :e', e: params[:username]).first
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_session_path, alert: "Invalid username or password"
    end
  end

  def destroy
    logout
    session[:user_id] = nil
    redirect_to '/index', alert: "You Successfully signed out"
  end
end
