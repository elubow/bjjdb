module InstructorsHelper
    def social_media_helper(instructor)
        insta_link = "https://instagram.com/" + instructor.instagram[1..-1]
        twitter_link = "https://twitter.com/" + instructor.twitter[1..-1]

        youtube_link = "https://youtube.com/user/" + instructor.youtube

        instagram = "<a href='" + insta_link + "'>" + insta_link + "</a></br>" if !instructor.instagram[1..-1].empty? && !instructor.instagram.empty?
        twitter = "<a href='" + twitter_link + "'>" + twitter_link + "</a></br>" if !instructor.twitter[1..-1].empty? && !instructor.twitter.empty?
        facebook = "<a href='" + instructor.facebook + "'>" + instructor.facebook + "</a></br>" if !instructor.facebook.empty?
        youtube = "<a href='" + youtube_link + "'>" + youtube_link + "</a>" if !instructor.youtube.empty?

        final_string = [instagram, twitter, facebook, youtube].reject{ |link| link == nil }

        return final_string.join('').html_safe
    end
end
