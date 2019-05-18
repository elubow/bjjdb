class Tag < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable

  scope :with_tag, -> (id) { where(id: id) }

  validates :category, presence: true
  validates :name, presence: true

  has_and_belongs_to_many :links

  after_validation :create_full_name, on: [:create, :update]

  scope :positions, -> { where(category: 'start-position') }
  scope :submissions, -> { where(category: 'submission') }
  scope :position_submission, -> { positions.or(submissions) }

  ransack_alias :full_tag, :category_or_name_or_full_name

  TAG_SEPARATOR = '::'

  def self.send_chain(methods)
    methods.inject(self, :send)
  end

  def clean_name
    self.name.gsub('-', ' ').titleize
  end

  # should only be called with a position tag and not a start/end position tag
  def create_start_end_position_tags
    ts = Time.now

    start_tag = Tag.new
    start_tag.category = 'start-position'
    start_tag.name = self.name
    start_tag.description = "Starting at #{self.description}"
    start_tag.created_at = ts
    start_tag.updated_at = ts
    start_tag.save!

    end_tag = Tag.new
    end_tag.category = 'end-position'
    end_tag.name = self.name
    end_tag.description = "Ending at #{self.description}"
    end_tag.created_at = ts
    end_tag.updated_at = ts
    end_tag.save!
  end

  def search_name
    rv = case self.category
         when 'start-position', 'end-position', 'position'
           '[P]'
         when 'submission'
           '[S]'
         when 'uniform'
           '[U]'
         when 'difficulty'
           '[B]' # belt
         end
    return "#{rv} #{self.name}"
  end

  private
    def create_full_name
      self.full_name = "#{self.category}#{TAG_SEPARATOR}#{self.name}"
    end
end
