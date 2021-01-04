class SessionsController < ApplicationController
  def logout 
    session.delete(:artist_id)
    redirect_to login_path
  end 

  def new 
    render :new
  end

  def create
    artist = Artist.find_by(name: params[:name])

    if artist && artist.authenticate(params[:password]) 
      session[:artist_id] = artist.id
      redirect_to artist_path(artist)
    else
      flash[:error] = "Password or name incorrect"
      redirect_to login_path 
    end 
  end 
end