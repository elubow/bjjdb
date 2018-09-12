class Instructor < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable

  has_and_belongs_to_many :links

  validates :name, presence: true, length: { minimum: 3 }

  ransack_alias :all_names, :nickname_or_name

  def has_videos?
    self.links.count > 0
  end

  def video_count
    self.links.count
  end

  def display_name
    rv = "#{self.name}"
    rv = rv + " (#{self.nickname})" if self.nickname.present?
    return rv
  end

  def nickname_or_name
    self.nickname.present? ? self.nickname : self.name
  end
end
