class Image < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :profile
  belongs_to :user
end
