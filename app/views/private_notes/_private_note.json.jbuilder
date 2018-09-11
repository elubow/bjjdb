json.extract! private_note, :id, :user_id, :link_id, :body, :title, :created_at, :updated_at
json.url private_note_url(private_note, format: :json)
