class Gym < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def average_stars
    self.reviews.average(:stars) rescue 0
  end

  def current_user_review_id(user)
    self.reviews.where(user: user).limit(1).first.id
  end

  def reviewed_by?(user)
    self.reviews.where(user: user).count > 0 ?
      true : false
  end
end
