class SessionsController < ApplicationController
  def create
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email].strip.downcase).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:success] = "You are now loged in."
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out."
    redirect_to root_path
  end
end
