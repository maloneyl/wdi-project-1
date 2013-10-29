class Music < ActiveRecord::Base

  attr_accessible :title, :genre, :track, :art

  validates :track, presence: true
  validates :title, presence: true

  belongs_to :user

  mount_uploader :art, ArtUploader  
  mount_uploader :track, TrackUploader

end
