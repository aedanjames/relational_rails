Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/hotels', to:'hotels#index'
  get '/suites', to: 'suites#index'
  get 'hotel/:id', to:'hotels#show'
  get '/suite/:id', to: 'suites#show'
  get '/hotel/:id/suites', to:'hotel_suites#index'
  get '/hotels/new', to: 'hotels#new'
  post '/hotels', to: 'hotels#create'
  
  patch '/organizations/:id', to: 'organizations#update'
  post '/organizations/', to: 'organizations#create'
  get '/organizations', to:'organizations#index'
  get '/organizations/new', to: 'organizations#new'
  get '/organizations/:id', to:'organizations#show'
  get '/organizations/:id/edit', to: 'organizations#edit'
  
  get '/organizations/:id/fighters', to: 'organization_fighters#index'
  get '/organizations/:id/fighters/new', to: 'organization_fighters#new'
  post '/organizations/:id/fighters', to: 'organization_fighters#create'
  
  get '/fighters', to:'fighters#index'
  get 'fighters/:id', to:'fighters#show'
end
