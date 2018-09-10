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
    if @lt.images.count > 0
      img = @lt.images.first
      @thumbnail.source = img.src
    end
    @thumbnail.save!
  end
end
