class AddRemoteImageToThumbnails < ActiveRecord::Migration[5.2]
  def change
    add_column :thumbnails, :remote_image, :string
  end
end
