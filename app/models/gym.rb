class Gym < ApplicationRecord
  include AASM
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :website, format: {with: Regexp.new(URI::regexp(%w(http https)))}, allow_blank: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }, allow_blank: true

  geocoded_by :address_full
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: ->(obj){ obj.address_full.present? and obj.address_full_changed? }
  
  aasm do
    # initial state of a gym that someone created
    state :unverified, initial: true
    # everything's good, just don't want it public for a moment
    state :verified
    # These can probably be deleted at some point
    state :rejected
    # someone flagged the gym for some reason
    state :flagged
    # everything is good and gym is visible
    state :published

    after_all_transitions :log_status_change

    event :verify do
      transitions from: [:unverified], to: :verified
    end

    event :reject do
      transitions from: [:unverified, :published], to: :rejected
    end

    event :publish do
      transitions from: [:unverified, :verified, :flagged], to: :published
    end

    event :unpublish do
      transitions from: [:published], to: :verified
    end
  end

  scope :recently_created, -> {unverified.where(created_at: [24.hours.ago..Time.now]) }
  scope :reviewable_gyms, -> {published.or(recently_created)}

  scope :with_lat, -> { where.not(latitude: nil) }
  scope :with_lng, -> { where.not(longitude: nil) }
  scope :with_coordinates, -> { with_lat.with_lng }

  def self.ransackable_scopes(auth_object = nil)
    [:reviewable_gyms, :recently_created, :published, :unverified]
  end

  def self.all_for_map
    reviewable_gyms.with_coordinates.pluck(:latitude, :longitude, :id)
  end

  def log_status_change
    Rails.logger.info "Changing #{self.name} (#{self.id}) from #{aasm.from_state} to #{aasm.to_state}"
  end

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

  def primary_languages
    self.reviews.pluck(:languages).flatten.inject(Hash.new(0)) {|h,v|  h[v] += 1; h}.sort_by(&:values_at)[0..1]
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

  def pretty_city_state_country
    if self.city.present? and self.state.present? and self.country.present?
      "#{self.city}, #{self.state}, #{self.country}"
    elsif self.city.present? and self.country.present?
      "#{self.city}, #{self.country}"
    elsif self.country.present?
      self.country
    end
  end

  def presentable_address
    return self.address_full if self.address_full.present?
    address = ""
    if self.address_1.present?
      address = self.address_1
    end
    if self.address_2.present?
      address = "#{address}\n#{self.address_2}"
    end
    if self.city.present?
      address = "#{address}\n#{self.city},"
    end
    if self.state.present?
      address = "#{address} #{self.state}"
    end
    if self.postal_code.present?
      address = "#{address} #{self.postal_code}"
    end
    if self.country.present?
      address = "#{address}\n#{self.country}"
    end
    address
  end
end
