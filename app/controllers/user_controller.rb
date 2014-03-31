class UserController < ApplicationController

  def new

  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render :show
    else
      flash.now[:errors] = ["Invalid Credentials, Buddy Lamers"]
      render :new
    end
  end

  def edit

  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes
      render :show
    else
      flash.now[:errors] = ["Invalid Credentials, Buddy Lamers"]
      render :edit
    end
  end

  def destroy

  end

  def index

  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
