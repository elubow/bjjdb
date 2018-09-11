class Link < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :private_notes, dependent: :destroy
  has_and_belongs_to_many :tags
  has_one :thumbnail, dependent: :destroy

  after_validation :set_location, on: [:create, :update]
  after_commit { GetVideoMetadataJob.perform_later self}

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true


  def thumbnail_image_location(width, height)
    if self.thumbnail.nil? or self.thumbnail.source.nil?
      return "//via.placeholder.com/#{width}x#{height}"
    else
      self.thumbnail.source
    end
  end

  def description_exists?
    if (!self.description.nil? and self.description.length > 0) or
    (!self.thumbnail.description.nil? and self.thumbnail.description.length > 0)
      return true
    end

    return false
  end

  def show_description
    if !self.description.nil? and self.description.length > 0
      return self.description
    end

    if !self.thumbnail.description.nil? and self.thumbnail.description.length > 0
      return self.thumbnail.description
    end
  end

  private
    def set_location
      self.location = URI.parse(self.url).host.downcase
      self.location.sub!('www.', '') if self.location.starts_with?('www.')
    end
end
