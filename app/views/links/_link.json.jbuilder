json.extract! link, :id, :title, :url, :description, :created_at, :updated_at
json.url link_url(link, format: :json)
json.favorited signed_in? ? current_user.favorited?(link) : false
json.favorites_count link.users_count || 0
