module SessionHelper

  def current_user
    User.find_by_access_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    user.reset_access_token!
    session[:token] = user.access_token
  end

  def logout
    current_user.reset_access_token!
    session[:token] = nil
  end

  def auth_token
    html = <<-HTML.html_safe
      <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

    HTML

  end

end
