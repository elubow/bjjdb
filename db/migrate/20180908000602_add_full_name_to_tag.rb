class AddFullNameToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :full_name, :string
  end
end
