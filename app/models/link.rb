class Link < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
