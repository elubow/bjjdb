class AddLatLngToGym < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :address_full, :string
    add_column :gyms, :latitude, :decimal
    add_column :gyms, :longitude, :decimal
  end
end
