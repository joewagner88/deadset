Rails.application.routes.draw do
  resources :artist_shows
  resources :setlist_songs
  resources :shows
  resources :setlists
  resources :songs
  resources :venues
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
