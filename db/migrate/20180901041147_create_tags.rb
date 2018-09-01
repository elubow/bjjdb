class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :category
      t.string :name
      t.string :value
      t.text :description

      t.timestamps
    end
  end
end
