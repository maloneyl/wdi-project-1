class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true

  attr_accessible :email, :name, :role, :username, :password, :password_confirmation

  has_one :profile, dependent: :destroy
  has_many :music, dependent: :destroy
  has_many :comments, dependent: :destroy

  def role?(r)
    self.role == r.to_s
  end


end
