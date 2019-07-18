json.extract! venue, :id, :name, :city, :state, :country, :created_at, :updated_at
json.url venue_url(venue, format: :json)
