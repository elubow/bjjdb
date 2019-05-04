class StatsController < ApplicationController

  def site
    @stats = {}
    [User, Favorite, Rating, Instructor, Tag, Impression, Comment, Thumbnail, PrivateNote].each do |model|
      @stats[model.to_s] = model.count
    end
    @links = Stat.collect_link_stats
    @links["Average Tags Per Video"] = Stat.average_tags_per_video
    @links["Videos with Ratings"] = Rating.pluck(:link_id).uniq.count
    @links["Videos with Favorites"] = Favorite.pluck(:link_id).uniq.count
  end
end
