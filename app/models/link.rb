class Link < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :private_notes, dependent: :destroy
  has_and_belongs_to_many :instructors
  has_and_belongs_to_many :tags
  has_one :thumbnail, dependent: :destroy
  has_many :ratings

  after_validation :set_location, on: [:create, :update]
  after_commit { GetVideoMetadataJob.perform_later self}

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true

  ransack_alias :title_description, :title_or_description
  scope :favorited_by, -> (user) { joins(:favorites).where(favorites: { user: user }) }
  scope :without_thumbnails, -> {
    where("
      NOT EXISTS (
        SELECT 1 FROM thumbnails
        WHERE thumbnails.link_id = links.id
      )")
  }
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

  def self.enqueue_thumbnails
    Link.without_thumbnails.each{|lnk|  GetVideoMetadataJob.perform_now(lnk)}
  end

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
      self.thumbnail.remote_image.url
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
    if self.thumbnail.present?
      self.thumbnail.favicon.present?
    end
  end

  # BEGIN related videos
  def has_position?
    self.tags.collect(&:category).uniq.include?("position")
  end

  def get_position_id
    self.tags.select {|t|  t.category == "position"}.first.id
  end

  def submission_id
    tags.select { |t| t.category == "submission" }.first.id
  end

  def submission?
    tags.collect(&:category).uniq.include?("submission") && Tag.find(submission_id).links.count > 0
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

  def videos_starting_from_end_position(limit=5)
    end_pos_id = self.get_end_position_id
    Tag.find_by_full_name("start-position::#{Tag.find(end_pos_id).name}").links.order(created_at: :desc).limit(limit+1)
  end

  def has_videos_starting_from_end_position?(limit=5)
    end_pos_id = self.get_end_position_id
    Tag.find_by_full_name("start-position::#{Tag.find(end_pos_id).name}").links.order(created_at: :desc).limit(limit+1).reject{|l|  l.id == self.id}.count > 0
  end

  def has_related_drills(limit=5)
    flow_id = Tag.find_by_full_name("move::flow").id
    drill_id = Tag.find_by_full_name("move::drill").id

    flow_drill = Link.left_joins(:tags).group(:id, :tag_id).where("tag_id IN (?)", [flow_id,drill_id]).reject{|l|  l.id == id}

    start_pos_id = get_start_position_id if has_start_position?
    position_id = get_position_id if has_position?
    submission_id = submission_id if submission?

    filter_tags = [start_pos_id, position_id, submission_id].reject{ |tag| tag == nil }
    if filter_tags.empty?
      return []
    end
    
    related_videos = Link.left_joins(:tags).group(:id, :tag_id).where("links.id IN (?) AND tags.id IN (?)",flow_drill, filter_tags).uniq.take(limit)
    
    return related_videos
  end

  # drills exist for getting into start-position or about 
  # the position or getting into the specified submssion 
  def has_drills?
    # TODO false until there are drill videos to test with
    false
  end

  # END related videos

  #Ratings related
  def get_current_rating
    all_ratings = self.ratings;
    if all_ratings.count === 0
      return 0
    end
    star_ratings_1 = all_ratings.where(value: 1).count
    star_ratings_2 = all_ratings.where(value: 2).count
    star_ratings_3 = all_ratings.where(value: 3).count
    star_ratings_4 = all_ratings.where(value: 4).count
    star_ratings_5 = all_ratings.where(value: 5).count

    return (((star_ratings_1 * 1) +
             (star_ratings_2 * 2) +
             (star_ratings_3 * 3) +
             (star_ratings_4 * 4) +
             (star_ratings_5 * 5)) /
             (star_ratings_1 + star_ratings_2 + star_ratings_3 + star_ratings_4 + star_ratings_5))
  end

  private
    def set_location
      self.location = URI.parse(self.url).host.downcase
      self.location.sub!('www.', '') if self.location.starts_with?('www.')
    end
end
