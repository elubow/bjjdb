class Gym < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def average_stars
    # self.reviews
    3.6
  end
end
