class User < ActiveRecord::Base
  validates :username, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(login_info)
    user = User.find_by(username: login_info[:username])
    if user && user.password == login_info[:password]
      user
    else
      nil
    end
  end

end
