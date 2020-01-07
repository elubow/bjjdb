class AddLanguagesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :languages, :text, array: true, default: []
  end
end
