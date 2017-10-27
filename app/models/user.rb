class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, presence: true, uniqueness: true
  validates :password, presence:

  has_secure_password
end
