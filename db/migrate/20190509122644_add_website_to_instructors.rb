class AddWebsiteToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :website, :string
  end
end
