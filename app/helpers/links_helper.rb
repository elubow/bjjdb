module LinksHelper
    def link_url_helper(height = 420, link)
        link_url = link.url.split('/')
        if link_url[2].include? "youtube"
            link_url[2] += '/embed'
            link_url[3] = link_url[3].split('=')[1]
        elsif link_url[2].include? "instagram"
            link_url[-1] += '/embed/captioned'
            height = 780
        else
            img = "<a target= '_blank' href='" + link.url + "'>" + 
            "<img alt='" + link.title + "' height='"+ height.to_s + "' width= '100%' class='card-img-top img-fluid pl-3 pr-3' src= '" + link.thumbnail_image_location(height,530) + "'/></a>"
            return img.html_safe
        end
        iframe = "<iframe width='100%' height='" + height.to_s + "' src='" + link_url.join('/') + "'></iframe>"
        return iframe.html_safe
    end
end
