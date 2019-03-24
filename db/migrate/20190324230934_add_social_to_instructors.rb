class AddSocialToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :instagram, :string
    add_column :instructors, :youtube, :string
    add_column :instructors, :twitter, :string
    add_column :instructors, :facebook, :string
  end
end
