class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def show
    # only logged in artist can view thier show page
    @artist = Artist.find(params[:id])
    if @current_artist == @artist
      render :show
    else
      redirect_to login_path 
    end  
  end

  def create
    artist = Artist.create(artist_params)

    if artist.valid?
      session[:artist_id] = artist.id
      redirect_to artist_path(artist)
    else 
      flash[:errors] = artist.errors.full_messages
      redirect_to new_artist_path
    end 
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :instrument, :years_active, :password)
  end
end
