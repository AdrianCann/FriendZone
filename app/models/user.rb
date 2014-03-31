class User < ActiveRecord::Base
  validates :email, :password_digest, :access_token, presence: true
  validates :email, :access_token, uniqueness: true

  def reset_access_token!
    self.access_token = User.generate_access_token
  end

  def self.generate_access_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(naked_password)
    self.password_digest = BCrypt::Password.create(naked_password)
  end

  def is_password?(naked_password)
    self.password_digest == BCrypt::Password.create(naked_password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return user if user.is_password?(password)
    nil
  end

end
