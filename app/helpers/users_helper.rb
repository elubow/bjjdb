module UsersHelper
  def create_reviews_js_markers(reviews)
    rv = ""
    reviews.each do |r|
      next unless r.gym.has_coordinates?
      rv = rv + "addReviewMarkerToUserMap(map, \"#{r.gym.name.html_safe}\", #{r.gym.latitude}, #{r.gym.longitude} );\n"
    end
    rv.html_safe
  end
end
