Rails.application.routes.draw do
  get '/studios/:id', to: 'studios#show'
  get '/movies/:id', to: 'movies#show'
  post '/movies/:id', to: 'movies#add_actor'
end
