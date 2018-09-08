class Link < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  after_validation :set_location, on: [:create, :update]

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true

  private
    def set_location
      self.location = URI.parse(self.url).host.downcase
      self.location.sub!('www.', '') if self.location.starts_with?('www.')
    end
end
