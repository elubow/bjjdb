json.links do
  json.array!(@links) do |link|
    json.name truncate(link.title)
    json.url link_path(link)
  end
end

json.tags do
  json.array!(@tags) do |tag|
    json.name tag.full_name
    json.url tag_path(tag)
  end
end
