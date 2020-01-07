class AddTransliterationToTranslationTerms < ActiveRecord::Migration[5.2]
  def change
    add_column :translation_terms, :transliteration, :string
  end
end
