json.links do
  json.array!(@links) do |link|
    json.name truncate(link.title, length: 20, separator: /\w+/)
    json.url link_path(link)
  end
end

json.tags do
  json.array!(@tags) do |tag|
    json.name truncate(tag.full_name, length: 24)
    json.url tag_path(tag)
  end
end
