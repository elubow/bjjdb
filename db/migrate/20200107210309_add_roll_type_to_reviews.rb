class AddRollTypeToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :roll_type, :integer
  end
end
