class AddFavoritesCounterCache < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :favorites_count, :integer, default: 0
  end
end
