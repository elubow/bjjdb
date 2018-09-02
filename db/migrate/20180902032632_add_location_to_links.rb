class AddLocationToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :location, :string
  end
end
