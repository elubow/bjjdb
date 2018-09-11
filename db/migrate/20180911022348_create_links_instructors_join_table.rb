class CreateLinksInstructorsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :links, :instructors do |t|
      t.index [:link_id, :instructor_id]
      t.index [:instructor_id, :link_id]
    end
  end
end
