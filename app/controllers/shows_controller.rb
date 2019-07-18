class ShowsController < ApplicationController
  before_action :set_show, only: [ :edit, :update, :destroy]
  # Removed show action from above

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.all
    response = HTTParty.get('https://api.setlist.fm/rest/1.0/artist/94f8947c-2d9c-4519-bcf9-6d11a24ad006/setlists?p=1', headers: {"Accept" => "application/json", "x-api-key": "X5zdk_R9xhoRkSxvDUDSV1n_1hlGGSRPwaDq"})
    results = JSON.parse(response.body)
    results["setlist"].each do |show|
      if Venue.find_by(mbid: show["venue"]["id"])
        # do nothing
      else
        @venue = Venue.create(mbid:    show["venue"]["id"], 
                             name:    show["venue"]["name"], 
                             city:    show["venue"]["city"]["name"],
                             state:   show["venue"]["city"]["state"],
                             country: show["venue"]["city"]["country"]["code"])
      end
      # do some not have venues? check for this
      if @venue
        @show = Show.create(name: show["venue"]["name"], event_date: show["eventDate"], venue_id: @venue.id)
      else
        @show = Show.create(name: show["venue"]["name"], event_date: show["eventDate"])
      end
      #  FIXME - hardcoded for dead & co with 3
      ArtistShow.create(artist_id: 3, show_id: @show.id)
      show["sets"]["set"].each do |set|
        set["song"].each do |song|
          if song["cover"]
            if Artist.find_by(mbid: song["cover"]["mbid"])
              # do nothing
            else
              @artist = Artist.create(name: song["cover"]["name"], sort_name: song["cover"]["sortName"], mbid: song["cover"]["mbid"])
            end
          end
          if @artist
            song = Song.create(name: song["name"], artist_id: @artist.id)      
          else
            song = Song.create(name: song["name"])
          end
        end
      end
    end
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = Show.find(params[:id])
    @setlists = Setlist.where(show_id: @show.id)
    @songs = []
    @setlists.each do |setlist|
      setlist_songs = SetlistSong.where(setlist_id: setlist.id)
      setlist_songs.each do |setlist_song|
        song = Song.find(setlist_song.song_id)
        @songs << song
      end
    end
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:name, :event_date)
    end
end
