class CreateLinkThumbnaildata < ActiveRecord::Migration[5.2]
  def change
    create_table :link_thumbnaildata do |t|
      t.string :source
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
