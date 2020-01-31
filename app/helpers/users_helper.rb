module UsersHelper
  def create_reviews_js_markers(reviews)
    rv = ""
    reviews.each do |r|
      next unless r.gym.has_coordinates?
      rv = rv + "addReviewMarkerToUserMap(map, \"#{r.gym.name.html_safe}\", #{r.gym.latitude}, #{r.gym.longitude} );\n"
    end
    rv.html_safe
  end

  def reviews_country_count(reviews)
    reviews.collect{|r|  r.gym}.pluck(:country).uniq.count
  end

  def reviews_gyms_count(reviews)
    reviews.collect{|r|  r.gym}.count
  end

  def reviews_gyms_per_country_average(reviews)
    reviews_gyms_count(reviews) / reviews_country_count(reviews)
  end
end
