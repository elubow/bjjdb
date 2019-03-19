class Thumbnail < ApplicationRecord
  mount_uploader :remote_image, RemoteImageUploader
  belongs_to :link
end
