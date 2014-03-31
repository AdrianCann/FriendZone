class MailsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:mails][:email])

    if user
      msg = UserMailer.forgot_password(user)
      msg.deliver!

      redirect_to new_session_url
    else
      flash.now[:errors] = ["That email does not exist, Buddy Lamers"]

      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user
      user.update!(password: params[:mails][:password])

      redirect_to new_session_url
    else
      flash.now[:errors] = ["Not good enough, Buddy Lamers"]

      render :edit
    end
  end
end
