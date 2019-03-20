class GetVideoMetadataJob < ApplicationJob
  queue_as :default

  def perform(link)
    begin
      @lt = LinkThumbnailer.generate(link.url)
    rescue LinkThumbnailer::Exceptions => e
      Rails.logger.error("Could not retrieve thumbnail for #{link.url}: #{e}")
      Rails.logger.error("Deleting link: #{link.url}")
      Link.find(link).destroy
      return
    end
    @thumbnail = Thumbnail.where(link_id: link.id).first_or_create

    @thumbnail.link = link
    @thumbnail.title = @lt.title
    @thumbnail.description = @lt.description
    if @lt.favicon.present?
      if URI.parse(@lt.favicon).host.nil?
        @thumbnail.favicon = "//#{link.location}#{@lt.favicon}"
      else
        @thumbnail.favicon = @lt.favicon
      end
    end
    if @lt.images.count > 0
      img = @lt.images.first
      @thumbnail.source = img.src
      dir_path = File.join Rails.root, 'public', 'downloads', 'users', link.user_id.to_s, 'images'
      FileUtils.mkdir_p(dir_path) unless File.exist?(dir_path)
      download_image(img.src, File.join(dir_path, (URI(img.src).path).split('/').last))
      @thumbnail.remote_remote_image_url = img.src
    end
    @thumbnail.save!
  end
  
  def download_image(url, dest)
    open(url) do |u|
      File.open(dest, 'wb') { |f| f.write(u.read) }
    end
  end
end
