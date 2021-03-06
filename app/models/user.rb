class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  has_many :posts
  has_many :profiles
  has_many :images

  validates_presence_of :password

  def self.authenticate(email,password)
    user=User.find_by_email(email)
    if user && user.password_hash==BCrypt::Engine.hash_secret(password,user.password_salt)
      user
    else
      p "auth failed"
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt=BCrypt::Engine.generate_salt
      self.password_hash=BCrypt::Engine.hash_secret(password,password_salt)
    end
  end

end
