module SetlistMiner
  extend self

  def fetch
    # hardcoded to params - artist_id and page 1 and api_key
    response = HTTParty.get('https://api.setlist.fm/rest/1.0/artist/94f8947c-2d9c-4519-bcf9-6d11a24ad006/setlists?p=1', headers: {"Accept" => "application/json", "x-api-key": "X5zdk_R9xhoRkSxvDUDSV1n_1hlGGSRPwaDq"})
    results = JSON.parse(response.body)
    results["setlist"].each do |show|
      puts "starting to run"
      # puts "EVENT DATE AND LOCATION" 
      # puts show["eventDate"]
      # puts show["lastUpdated"]
      # puts show["artist"]["mbid"]
      # puts show["artist"]["name"]
      # puts show["artist"]["sortName"]
      if Venue.find_by(mbid: show["venue"]["id"])
        # do nothing
      else
        venue = Venue.create(mbid:    show["venue"]["id"], 
                             name:    show["venue"]["name"], 
                             city:    show["venue"]["city"]["name"],
                             state:   show["venue"]["city"]["state"],
                             country: show["venue"]["city"]["country"]["code"])
      end



      # puts show["venue"]["name"]
      # puts show["venue"]["city"]["state"]
      # puts show["venue"]["city"]["stateCode"]
      # puts show["venue"]["city"]["country"]["code"]
      # # found out here tour name not always present
      # puts "STARTING SETS"
      show["sets"]["set"].each do |set|
        # puts set["name"]
        # puts "ENCORE" if set["encore"] == 1 || 2 || 3
        song = set["song"]
        if Artist.find_by(mbid: song["cover"]["mbid"])
          # do nothing
        else
          Artist.create(name: song["cover"]["name"], sort_name: song["cover"]["sortName"], mbid: song["cover"]["mbid"])
        end
        # Song.create(name: song["name"], artist_id: artist_id)

      end
    end
  end
end
