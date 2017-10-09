class SessionsController < ApplicationController


  def new
  end

  def create
    @user=User.find_by(email:params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      signin @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      flash[:success]="Wellcome #{@user.name}"
      redirect_to posts_path
    else
      flash.now[:danger]="Invalid email or password"
      render :new
    end
  end

  def destroy
    signout
    flash[:success]="You signed out successfully"
    redirect_to signin_path
  end



end
