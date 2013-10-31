class Music < ActiveRecord::Base

  attr_accessible :title, :genre, :track, :art, :description

  validates :track, presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :art, ArtUploader
  mount_uploader :track, TrackUploader

  acts_as_list scope: :user

end
