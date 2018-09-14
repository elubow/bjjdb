class Link < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :private_notes, dependent: :destroy
  has_and_belongs_to_many :instructors
  has_and_belongs_to_many :tags
  has_one :thumbnail, dependent: :destroy

  after_validation :set_location, on: [:create, :update]
  after_commit { GetVideoMetadataJob.perform_later self}

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true

  ransack_alias :title_description, :title_or_description
  scope :by_tags, -> (tag_ids) {
        sql = sanitize_sql_array [<<-SQL, tag_ids, tag_ids]
    (WITH links_tags_cte AS (
      SELECT link_id, array_agg(tag_id) as tags
      FROM links_tags
      WHERE tag_id in (?)
      GROUP BY link_id
    )
    SELECT links.* FROM links_tags_cte JOIN links ON links.id = links_tags_cte.link_id
    WHERE links_tags_cte.tags @> array[?]::int8[]) as links
    SQL

    from(sql)
  }

  def has_instructors?
    self.instructors.count > 0
  end

  def videos_by_instructors(limit=25)
    instructor_ids = self.instructors.collect(&:id)
    Link.joins(:instructors).where(instructors: {id: instructor_ids}).limit(limit).order(created_at: :desc).uniq.reject{|l|  l.id == self.id}[0..limit]
  end

  def thumbnail_image_location(width=250, height=250)
    if self.thumbnail.nil? or self.thumbnail.source.nil?
      return "//via.placeholder.com/#{width}x#{height}"
    else
      self.thumbnail.source
    end
  end

  def description_exists?
    if (!self.description.nil? and self.description.length > 0) or
      (!self.thumbnail.nil? and !self.thumbnail.description.nil? and self.thumbnail.description.length > 0)
      return true
    end

    return false
  end

  def show_description
    if !self.description.nil? and self.description.length > 0
      return self.description
    end

    if !self.thumbnail.nil?
      if !self.thumbnail.description.nil? and self.thumbnail.description.length > 0
        return self.thumbnail.description
      end
    end
  end

  def has_favicon?
    self.thumbnail.favicon.present?
  end

  # BEGIN related videos
  def has_position?
    self.tags.collect(&:category).uniq.include?("position")
  end

  def get_position_id
    self.tags.select {|t|  t.category == "position"}.first.id
  end

  def get_start_position_id
    self.tags.select {|t|  t.category == "start-position"}.first.id
  end

  def has_start_position?
    self.tags.collect(&:category).uniq.include?("start-position") and Tag.find(self.get_start_position_id).links.count > 0
  end

  # find videos where the end-position of previous video
  # is the same as the start-position of current video
  def has_end_position_same_as_start_position_videos?(limit=6)
    start_pos_id = self.get_start_position_id
    Tag.find_by_full_name("end-position::#{Tag.find(start_pos_id).name}").links.order(created_at: :desc).limit(limit).reject{|l|  l.id == self.id}.count > 0
  end

  def end_position_same_as_start_position(limit=5)
    start_pos_id = self.get_start_position_id
    Tag.find_by_full_name("end-position::#{Tag.find(start_pos_id).name}").links.order(created_at: :desc).limit(limit+1).reject{|l|  l.id == self.id}.take(limit)
  end

  def has_same_start_position_videos?(limit=5)
    start_pos_id = self.get_start_position_id
    Tag.find(start_pos_id).links.order(created_at: :desc).limit(limit).reject{|l|  l.id == self.id}.count > 0
  end

  def same_start_position(limit=5)
    start_pos_id = self.get_start_position_id
    Tag.find(start_pos_id).links.order(created_at: :desc).limit(limit+1).reject{|l|  l.id == self.id}.take(limit)
  end

  def has_end_position?
    self.tags.collect(&:category).uniq.include?("end-position")
  end

  def get_end_position_id
    self.tags.select {|t|  t.category == "end-position"}.first.id
  end

  def same_end_position(limit=5)
    end_pos_id = self.get_end_position_id
    Tag.find_by_full_name("start-position::#{Tag.find(end_pos_id).name}").links.order(created_at: :desc).limit(limit+1)
  end

  # drills exist for getting into start-position or about 
  # the position or getting into the specified submssion 
  def has_drills?
    # TODO false until there are drill videos to test with
    false
  end

  # END related videos

  private
    def set_location
      self.location = URI.parse(self.url).host.downcase
      self.location.sub!('www.', '') if self.location.starts_with?('www.')
    end
end
