class AddDropInInfotoReviews < ActiveRecord::Migration[5.2]
  def change
    add_monetize :reviews, :drop_in_fee, amount: { null: true, default: nil }
    add_column :reviews, :drop_in_date, :date, default: nil
  end
end
