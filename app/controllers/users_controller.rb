class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
