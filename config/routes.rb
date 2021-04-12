Rails.application.routes.draw do
  get '/studios/:id', to: 'studios#show'
end
