Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/hotels', to:'hotels#index'
  get '/suites', to: 'suites#index'
  get '/hotels/new', to: 'hotels#new'
  get 'hotels/:id', to:'hotels#show'
  get '/suites/:id', to: 'suites#show'
  get '/hotels/:id/suites', to:'hotel_suites#index'
  post '/hotels', to: 'hotels#create'
  get '/hotels/:id/edit', to: 'hotels#edit'
  patch '/hotels/:id', to: 'hotels#update'
  post '/hotels/', to: 'hotels#create'
  get 'hotels/:id/suites/new', to: 'hotel_suites#new'
  post '/hotels/:id/suites', to: 'hotel_suites#create'
  get 'suites/:id/edit', to: 'suites#edit'
  patch 'suites/:id', to: 'suites#update'

  patch '/organizations/:id', to: 'organizations#update'
  post '/organizations/', to: 'organizations#create'
  get '/organizations', to:'organizations#index'
  get '/organizations/new', to: 'organizations#new'
  get '/organizations/:id', to:'organizations#show'
  get '/organizations/:id/edit', to: 'organizations#edit'

  get '/organizations/:id/fighters', to: 'organization_fighters#index'
  get '/organizations/:id/fighters/new', to: 'organization_fighters#new'
  post '/organizations/:id/fighters', to: 'organization_fighters#create'
  delete '/organizations/:id', to: 'organizations#destroy'

  get '/fighters', to:'fighters#index'
  get 'fighters/:id', to:'fighters#show'
  get 'fighters/:id/edit', to: 'fighters#edit'
  patch 'fighters/:id', to: 'fighters#update'
  delete '/fighters/:id', to: 'fighters#destroy'
end
