class SessionController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)

      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid Credentials, Buddy Lamers!"]

      render :new
    end
  end

  def destroy
    logout
    render :new
  end

end