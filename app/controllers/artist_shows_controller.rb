class ArtistShowsController < ApplicationController
  before_action :set_artist_show, only: [:show, :edit, :update, :destroy]

  # GET /artist_shows
  # GET /artist_shows.json
  def index
    @artist_shows = ArtistShow.where(artist_id: 3)
  end

  # GET /artist_shows/1
  # GET /artist_shows/1.json
  def show
  end

  # GET /artist_shows/new
  def new
    @artist_show = ArtistShow.new
  end

  # GET /artist_shows/1/edit
  def edit
  end

  # POST /artist_shows
  # POST /artist_shows.json
  def create
    @artist_show = ArtistShow.new(artist_show_params)

    respond_to do |format|
      if @artist_show.save
        format.html { redirect_to @artist_show, notice: 'Artist show was successfully created.' }
        format.json { render :show, status: :created, location: @artist_show }
      else
        format.html { render :new }
        format.json { render json: @artist_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artist_shows/1
  # PATCH/PUT /artist_shows/1.json
  def update
    respond_to do |format|
      if @artist_show.update(artist_show_params)
        format.html { redirect_to @artist_show, notice: 'Artist show was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist_show }
      else
        format.html { render :edit }
        format.json { render json: @artist_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_shows/1
  # DELETE /artist_shows/1.json
  def destroy
    @artist_show.destroy
    respond_to do |format|
      format.html { redirect_to artist_shows_url, notice: 'Artist show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_show
      @artist_show = ArtistShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_show_params
      params.fetch(:artist_show, {})
    end
end
