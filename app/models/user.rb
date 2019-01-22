class User < ActiveRecord::Base

  has_secure_password


  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum:6 }
  validates :name, presence: true

  def self.authenticate_with_credentials(email, password)

    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    end

  end



end