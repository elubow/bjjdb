class CreateTranslationTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :translation_terms do |t|
      t.text :body
      t.text :language
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_column :translation_terms, :base_term_id, :integer, default: 0, index: true
  end
end
