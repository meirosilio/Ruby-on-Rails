class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user= User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      signin @user
      remember @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to posts_path
    else

      errors_template(@user)
      render :new

    end
  end





  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
