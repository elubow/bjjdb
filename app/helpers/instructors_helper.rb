module InstructorsHelper
    def social_media_helper(instructor)

        if !instructor.instagram.empty? && !instructor.instagram[1..-1].empty?
            instagram = "<a href='" + "https://instagram.com/" + instructor.instagram[1..-1] + "'>" + "https://instagram.com/" + instructor.instagram[1..-1] + "</a></br>" 
        end
        if !instructor.twitter.empty? && !instructor.twitter[1..-1].empty?
            twitter = "<a href='" + "https://twitter.com/" + instructor.twitter[1..-1] + "'>" + "https://twitter.com/" + instructor.twitter[1..-1] + "</a></br>"
        end

        facebook = "<a href='" + instructor.facebook + "'>" + instructor.facebook + "</a></br>" if !instructor.facebook.empty?
        youtube = "<a href='" + "https://youtube.com/user/" + instructor.youtube + "'>" + "https://youtube.com/user/" + instructor.youtube + "</a>" if !instructor.youtube.empty?
        final_string = [instagram, twitter, facebook, youtube].reject{ |link| link == nil }

        return final_string.join('').html_safe
    end
end
