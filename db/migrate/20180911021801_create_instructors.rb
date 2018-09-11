class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :nickname
      t.text :description

      t.timestamps
    end
  end
end
