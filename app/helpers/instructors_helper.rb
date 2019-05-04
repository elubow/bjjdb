module InstructorsHelper
    def social_media_helper_short(instructor)
        if !instructor.instagram.nil? && !instructor.instagram.empty? && !instructor.instagram[1..-1].empty?
            instagram = "<a target='_blank' href='" + "https://instagram.com/" + instructor.instagram[1..-1] + "'>IG</a>" 
        end

        if !instructor.twitter.nil? && !instructor.twitter.empty? && !instructor.twitter[1..-1].empty?
            twitter = "<a target='_blank' href='" + "https://twitter.com/" + instructor.twitter[1..-1] + "'>Tw</a>"
        end

        facebook = "<a target='_blank' href='" + instructor.facebook + "'>FB</a>" if !instructor.facebook.nil? && !instructor.facebook.empty?
        youtube = "<a target='_blank' href='" + "https://youtube.com/user/" + instructor.youtube + "'>YT</a>" if !instructor.youtube.nil? && !instructor.youtube.empty?
        final_string = [instagram, twitter, facebook, youtube].reject{ |link| link == nil }

        return final_string.join(' &nbsp;').html_safe
    end

    def social_media_helper(instructor)
        if !instructor.instagram.nil? && !instructor.instagram.empty? && !instructor.instagram[1..-1].empty?
            instagram = "<a href='" + "https://instagram.com/" + instructor.instagram[1..-1] + "'>" + "https://instagram.com/" + instructor.instagram[1..-1] + "</a></br>" 
        end
        if !instructor.twitter.nil? && !instructor.twitter.empty? && !instructor.twitter[1..-1].empty?
            twitter = "<a href='" + "https://twitter.com/" + instructor.twitter[1..-1] + "'>" + "https://twitter.com/" + instructor.twitter[1..-1] + "</a></br>"
        end

        facebook = "<a href='" + instructor.facebook + "'>" + instructor.facebook + "</a></br>" if !instructor.facebook.nil? && !instructor.facebook.empty?
        youtube = "<a href='" + "https://youtube.com/user/" + instructor.youtube + "'>" + "https://youtube.com/user/" + instructor.youtube + "</a>" if !instructor.youtube.nil? && !instructor.youtube.empty?
        final_string = [instagram, twitter, facebook, youtube].reject{ |link| link == nil }

        return final_string.join('').html_safe
    end
end
