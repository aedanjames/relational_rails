Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/hotels', to:'hotels#index'
  get '/suites', to: 'suites#index'
  get '/organizations', to:'organizations#index'
  get '/fighters', to:'fighters#index'
  get '/organization/:id', to:'organizations#show'
  get '/organization/:id/fighters', to: 'organization_fighters#index'
  get 'hotel/:id', to:'hotels#show'
  get 'fighter/:id', to:'fighters#show'
  get '/suite/:id', to: 'suites#show'
  get '/hotel/:id/suites', to:'hotel_suites#index'
  get '/organizations/new', to: 'organizations#new'
end
