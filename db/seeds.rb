# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create(name: "Jerry Garcia", sort_name: "Garcia, Jerry", mbid: 1)
Artist.create(name: "Grateful Dead", sort_name: "Grateful Dead", mbid: 2)
Artist.create(name: "Dead & Co", sort_name: "Dead & Co", mbid: 3)
Venue.create(name: "Hollywood Bowl", city: "Los Angeles", state: "CA", country: "US", mbid: 1)
Venue.create(name: "Wrigley Field", city: "Chicago", state: "IL", country: "US", mbid: 2)
Show.create(name: "Wrigley Field 2019", event_date: "20190601", venue_id: 1)
Show.create(name: "Hollywood Bowl 2019", event_date: "20190602", venue_id: 2)
Song.create(name: "Touch of Grey", artist_id: 1)
Song.create(name: "One more Saturday night", artist_id: 1)
Song.create(name: "Estimated Prophet", artist_id: 2)
Song.create(name: "Cassidy", artist_id: 2)
Song.create(name: "Mississippi Half-Step", artist_id: 2)
Song.create(name: "Dark Star", artist_id: 2)
Song.create(name: "I know you rider", artist_id: 2)
Song.create(name: "China Cat", artist_id: 2)
Song.create(name: "China Doll", artist_id: 2)
Song.create(name: "Ripple", artist_id: 2)
Song.create(name: "Brokedown Palace", artist_id: 2)
Song.create(name: "Tennessee Jed", artist_id: 2)
Setlist.create(number: 1, show_id: 1)
Setlist.create(number: 2, show_id: 1)
Setlist.create(number: 3, encore: 1, show_id: 1)
Setlist.create(number: 1, show_id: 2)
Setlist.create(number: 2, show_id: 2)
Setlist.create(number: 3, encore: 1, show_id: 2)
SetlistSong.create(setlist_id: 1, song_id: 1, position: 1)
SetlistSong.create(setlist_id: 1, song_id: 2, position: 2)
SetlistSong.create(setlist_id: 2, song_id: 3, position: 1)
SetlistSong.create(setlist_id: 2, song_id: 4, position: 2)
SetlistSong.create(setlist_id: 3, song_id: 5, position: 1)
SetlistSong.create(setlist_id: 4, song_id: 6, position: 1)
SetlistSong.create(setlist_id: 4, song_id: 7, position: 2)
SetlistSong.create(setlist_id: 5, song_id: 1, position: 1)
SetlistSong.create(setlist_id: 5, song_id: 2, position: 2)
SetlistSong.create(setlist_id: 6, song_id: 8, position: 1)
ArtistShow.create(artist_id: 3, show_id: 1)
ArtistShow.create(artist_id: 3, show_id: 2)

