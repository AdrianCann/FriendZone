class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def forgot_password(user)
    @user = user
    @url  = edit_mail_url(@user.id)
    mail(to: user.email, subject: 'Reset Password')
  end
end
