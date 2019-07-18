class SetlistSongsController < ApplicationController
  before_action :set_setlist_song, only: [:show, :edit, :update, :destroy]

  # GET /setlist_songs
  # GET /setlist_songs.json
  def index
    @setlist_songs = SetlistSong.all
  end

  # GET /setlist_songs/1
  # GET /setlist_songs/1.json
  def show
  end

  # GET /setlist_songs/new
  def new
    @setlist_song = SetlistSong.new
  end

  # GET /setlist_songs/1/edit
  def edit
  end

  # POST /setlist_songs
  # POST /setlist_songs.json
  def create
    @setlist_song = SetlistSong.new(setlist_song_params)

    respond_to do |format|
      if @setlist_song.save
        format.html { redirect_to @setlist_song, notice: 'Setlist song was successfully created.' }
        format.json { render :show, status: :created, location: @setlist_song }
      else
        format.html { render :new }
        format.json { render json: @setlist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setlist_songs/1
  # PATCH/PUT /setlist_songs/1.json
  def update
    respond_to do |format|
      if @setlist_song.update(setlist_song_params)
        format.html { redirect_to @setlist_song, notice: 'Setlist song was successfully updated.' }
        format.json { render :show, status: :ok, location: @setlist_song }
      else
        format.html { render :edit }
        format.json { render json: @setlist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setlist_songs/1
  # DELETE /setlist_songs/1.json
  def destroy
    @setlist_song.destroy
    respond_to do |format|
      format.html { redirect_to setlist_songs_url, notice: 'Setlist song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setlist_song
      @setlist_song = SetlistSong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setlist_song_params
      params.fetch(:setlist_song, {})
    end
end
