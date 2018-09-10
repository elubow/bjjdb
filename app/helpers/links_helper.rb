module LinksHelper
  def has_start_position?(link)
    link.tags.collect(&:category).uniq.include?("start-position") and Tag.find(get_start_position_id(link)).links.count > 0
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

  def has_same_start_position_videos?(link)
    start_pos_id = get_start_position_id(link)
    Tag.find(start_pos_id).links.order(created_at: :desc).limit(5).reject{|l|  l.id}.count > 0
  end

  def same_start_position(link)
    start_pos_id = get_start_position_id(link)
    Tag.find(start_pos_id).links.order(created_at: :desc).limit(5).reject{|l|  l.id}[0..4]
  end

  def same_end_position(link)
    end_pos_id = get_end_position_id(link)
    Tag.find_by_full_name("start-position::#{Tag.find(end_pos_id).name}").links.order(created_at: :desc).limit(5)
  end

  # find videos where the end-position of previous video
  # is the same as the start-position of current video
  def has_end_position_same_as_start_position_videos?(link)
    start_pos_id = get_start_position_id(link)
    Tag.find_by_full_name("end-position::#{Tag.find(start_pos_id).name}").links.order(created_at: :desc).limit(6).reject{|l|  l.id == link.id}.count > 0
  end

  def end_position_same_as_start_position(link)
    start_pos_id = get_start_position_id(link)
    # this feels painfully wrong to write this
    Tag.find_by_full_name("end-position::#{Tag.find(start_pos_id).name}").links.order(created_at: :desc).limit(6).reject{|l|  l.id == link.id}[0..4]
  end

  # drills exist for getting into start-position or about 
  # the position or getting into the specified submssion 
  def has_drills?(link)
    false
  end
end
