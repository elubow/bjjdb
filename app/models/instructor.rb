class Instructor < ApplicationRecord
  has_and_belongs_to_many :links

  validates :name, presence: true, length: { minimum: 3 }

  def video_count
    self.links.count
  end

  def display_name
    rv = "#{self.name}"
    rv = rv + " (#{self.nickname})" if self.nickname.present?
    return rv
  end
end
