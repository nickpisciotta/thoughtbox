class SessionsController < ApplicationController

  def create
   @user = User.find_by(email: params.dig("session", "email"))
   if @user && @user.authenticate(params.dig("session", "password"))
     session[:user_id] = @user.id
     redirect_to links_path
   else
     flash.now[:error] = "Invalid Login"
     render :new
   end
 end

  def destroy
    session.clear
    redirect_to login_path
  end

end
