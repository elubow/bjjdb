class CreateLinksTagsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :links, :tags do |t|
      t.index :link_id
      t.index :tag_id
    end
  end
end
