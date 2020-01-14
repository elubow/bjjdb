class AddStateToGyms < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :aasm_state, :string
  end
end
