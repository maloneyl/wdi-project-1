class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :user_type, presence: true

  attr_accessible :email, :name, :user_type, :handle, :password, :password_confirmation

  has_one :profile  
  has_many :music
  has_many :comments

  # FOR CANCAN LATER:
  # def role?(r)
  #   self.role == r.to_s
  # end  

end
