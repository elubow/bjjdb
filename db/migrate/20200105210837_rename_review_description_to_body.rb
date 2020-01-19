class RenameReviewDescriptionToBody < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :description, :body
  end
end
