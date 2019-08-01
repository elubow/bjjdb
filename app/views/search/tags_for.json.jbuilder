json.tags do
  json.array!(@tags) do |tag|
    json.id tag.id
    json.name tag.search_name
  end
end
