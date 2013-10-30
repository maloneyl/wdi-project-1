class Comment < ActiveRecord::Base

  attr_accessible :content, :music_id

  validates :content, presence: true

  belongs_to :music
  belongs_to :user

end