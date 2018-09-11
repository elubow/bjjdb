class CreatePrivateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :private_notes do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
