Rails.application.routes.draw do
  # resources :genres
  # resources :songs
  # resources :artists
  get '/artists/new', to: 'artists#new', as: 'new_artist'
  get '/artists/:id', to: 'artists#show', as: 'artist'
  post '/artists', to: 'artists#create'

  get '/artists/:artist_id/songs/new', to: 'songs#new', as: 'new_artist_song'
  get'/artists/:artist_id/songs/:id/edit', to: 'songs#edit', as: 'edit_artist_song'
  post '/artists/:artist_id/songs', to: 'songs#create', as: 'artists_songs'
  patch'/artists/:artist_id/songs/:id', to: 'songs#update', as: 'artist_song'
  delete '/artists/:artist_id/songs/:id', to: 'songs#destroy'

  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get '/sessions/new', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
