class Tag < ApplicationRecord
  has_and_belongs_to_many :links

  ransack_alias :full_tag, :category_or_name_or_full_name

  def full_name
    "#{self.category}::#{self.name}"
  end
end
