class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to links_path
    else
      render :new
    end
  end


  private

    def user_params
      params.require(:user).permit(:email, :password_digest, :password_confirmation)
    end

end
