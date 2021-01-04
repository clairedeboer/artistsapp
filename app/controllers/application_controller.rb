class ApplicationController < ActionController::Base
  before_action :find_logged_in_user

  def find_logged_in_user
    @current_artist = Artist.find_by(id: session[:artist_id])
  end 

end
