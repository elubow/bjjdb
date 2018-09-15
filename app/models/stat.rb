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
end
