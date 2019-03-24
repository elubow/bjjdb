class Stat

  def self.collect_link_stats
    rv = {}
    rv["Total"] = Link.count
    rv["Links Per User"] = Link.count / User.count
    rv
  end

  def self.top_link_stats
    rv = {}
    rv["Most Viewed Link"] = Link.find(Impression.where(impressionable_type: 'Link').group(:impressionable_id).count.max[0])
    rv
  end

  def self.average_tags_per_video
    total_tags = 0
    Link.all.each {|l|  total_tags += l.tags.count}
    total_tags/Link.count
  end
end
