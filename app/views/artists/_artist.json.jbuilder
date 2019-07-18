json.extract! artist, :id, :name, :sort_name, :mbid, :created_at, :updated_at
json.url artist_url(artist, format: :json)
