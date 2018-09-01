class AddUrlIndexToLinks < ActiveRecord::Migration[5.2]
  def change
    add_index :links, :url, unique: true
  end
end
