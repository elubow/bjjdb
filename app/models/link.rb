class Link < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
