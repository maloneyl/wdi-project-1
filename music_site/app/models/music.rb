class Music < ActiveRecord::Base

  attr_accessible :title, :genre, :track, :art, :description

  validates :track, presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :comments

  mount_uploader :art, ArtUploader  
  mount_uploader :track, TrackUploader

end
