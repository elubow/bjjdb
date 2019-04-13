module LinksHelper
    def link_url_helper(height = 420, link)
        link_url = link.url.split('/')
        if link_url[2].include? "youtube"
            link_url[2] += '/embed'
            link_url[3] = link_url[3].split('=')[1]
        else
            link_url[-1] += '/embed/captioned'
            height = 780
        end
        iframe = "<iframe width='100%' height='" + height.to_s + "' src='" + link_url.join('/') + "'></iframe>"
        return iframe.html_safe
    end
end
