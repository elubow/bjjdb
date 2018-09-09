class AddLinkToLinkThumbnaildatum < ActiveRecord::Migration[5.2]
  def change
    add_reference :link_thumbnaildata, :link, foreign_key: true, unique: true
  end
end
