class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to current_user
    end
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      # redirect_to user_path(user)
    else
      redirect_to '/'
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
