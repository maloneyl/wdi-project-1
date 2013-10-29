class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :user_type, presence: true

  attr_accessible :email, :name, :user_type, :handle, :password, :password_confirmation

  has_many :music
  has_one :profile

  # FOR CANCAN LATER:
  # def role?(r)
  #   self.role == r.to_s
  # end  

end
