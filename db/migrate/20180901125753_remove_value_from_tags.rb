class RemoveValueFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :value, :string
  end
end
