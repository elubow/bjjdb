class LinkThumbnailDataToThumbnail < ActiveRecord::Migration[5.2]
  def change
    rename_table :link_thumbnaildata, :thumbnails
  end
end
