class StatsController < ApplicationController

  def site
    @stats = {}
    [User, Instructor, Tag, Impression, Comment, Thumbnail, PrivateNote].each do |model|
      @stats[model.to_s] = model.count
    end
    @links = Stat.collect_link_stats

  end
end
