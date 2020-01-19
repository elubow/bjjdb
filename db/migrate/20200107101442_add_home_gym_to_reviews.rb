class AddHomeGymToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :home_gym, :boolean, default: false
  end
end
