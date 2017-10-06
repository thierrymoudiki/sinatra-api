class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, presence: true
  validates :password, presence: true

end
