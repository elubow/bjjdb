class Gym < ApplicationRecord
  has_many :reviews, dependent: :destroy

  geocoded_by :address_full
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: ->(obj){ obj.address_full.present? and obj.address_full_changed? }
  
  def roll_type
    self.reviews.average(:roll_type) rescue 0
  end

  def average_stars
    self.reviews.average(:stars) rescue 0
  end

  def drop_in_fee_reported
    self.reviews.where('drop_in_fee_cents > 0')
  end

  def total_times_rated
    self.reviews.where('stars > 0').count
  end

  def current_user_review_id(user)
    self.reviews.where(user: user).limit(1).first.id
  end

  def reviewed_by?(user)
    self.reviews.where(user: user).count > 0 ?
      true : false
  end

  def languages
    self.reviews.pluck(:languages).flatten.reject(&:empty?)
  end

  def languages_counter
    self.languages.inject(Hash.new(0)) {|h,v| h[v] += 1; h }
  end

  def languages_unique
    self.languages.uniq
  end

  def tags
    self.reviews.pluck(:tags).flatten.reject(&:empty?)
  end

  def tags_counter
    self.tags.inject(Hash.new(0)) {|h,v| h[v] += 1; h }
  end

  def tags_unique
    self.tags.uniq
  end

  def has_coordinates?
    return true if self.latitude.present? and self.longitude.present?
    false
  end
end
