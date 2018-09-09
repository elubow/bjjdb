class Tag < ApplicationRecord
  has_and_belongs_to_many :links

  after_validation :create_full_name, on: [:create, :update]

  ransack_alias :full_tag, :category_or_name_or_full_name

  TAG_SEPARATOR = '::'

  private
    def create_full_name
      self.full_name = "#{self.category}#{TAG_SEPARATOR}#{self.name}"
    end
end
