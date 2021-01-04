class SongsController < ApplicationController
  before_action :check_authorization

  def check_authorization
    if @current_artist != Artist.find(params[:artist_id])
      redirect_to login_path
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to artist_path(@song.artist)
  end

  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
    @genres = Genre.all
  end

  #post '/artists/:artist_id/songs', to: 'songs#create'
  def create
    @song = Song.create(create_song_params)
    redirect_to artist_path(params[:artist_id])
  end

  def edit
    @song = Song.find(params[:id])
    @genres = Genre.all
  end

  def update
    @song = Song.find(params[:id])
    @song.update(update_song_params)
    redirect_to artist_path(@song.artist)
  end

  private
  def create_song_params
    params.permit(:name, :album, :release_date, :artist_id, :genre_id)
  end

  def update_song_params
    params.require(:song).permit(:name, :album, :release_date, :genre_id)
  end
end
