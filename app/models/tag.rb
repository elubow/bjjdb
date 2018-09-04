class Tag < ApplicationRecord
  has_and_belongs_to_many :links

  def full_name
    "#{self.category}::#{self.name}"
  end
end
