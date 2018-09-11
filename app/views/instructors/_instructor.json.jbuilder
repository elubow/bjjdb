json.extract! instructor, :id, :name, :nickname, :description, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
