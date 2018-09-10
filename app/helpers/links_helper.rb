module LinksHelper
  def has_start_position?(link)
    link.tags.collect(&:category).uniq.include?("start-position")
  end

  def has_end_position?(link)
    link.tags.collect(&:category).uniq.include?("end-position")
  end

  def has_position?(link)
    link.tags.collect(&:category).uniq.include?("position")
  end

  def get_start_position_id(link)
    link.tags.select {|t|  t.category == "start-position"}.first.id
  end

  def get_end_position_id(link)
    link.tags.select {|t|  t.category == "end-position"}.first.id
  end

  def get_position_id(link)
    link.tags.select {|t|  t.category == "position"}.first.id
  end

  def same_start_position(link)
    start_pos_id = get_start_position_id(link)
    Tag.find(start_pos_id).links.order(created_at: :desc).limit(5)
  end

  def same_end_position(link)
    end_pos_id = get_end_position_id(link)
    Tag.find_by_full_name("start-position::#{Tag.find(end_pos_id).name}").links.order(created_at: :desc).limit(5)
  end
end
