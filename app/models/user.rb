class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password, message: "Passwords Must Match"
<<<<<<< HEAD

  has_many :links
=======
>>>>>>> 4fe3e50fdf06289f5a17f810708c514b88f77a91
end
