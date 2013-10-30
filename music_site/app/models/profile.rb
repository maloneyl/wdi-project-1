class Profile < ActiveRecord::Base

  attr_accessible :avatar, :bio, :location, :twitter, :facebook, :website, :font_face_primary, :font_face_secondary, :font_color_primary, :font_color_secondary, :link_color, :background_image

  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  # will need one for background (or header) image too

end
