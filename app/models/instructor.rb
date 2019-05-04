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
    if self.instagram.present?
      rv = rv + " (#{self.instagram})"
    elsif self.nickname.present?
      rv = rv + " (#{self.nickname})"
    end
    return rv
  end

  def nickname_or_name
    self.nickname.present? ? self.nickname : self.name
  end
end
