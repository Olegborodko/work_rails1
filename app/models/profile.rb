class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
end
