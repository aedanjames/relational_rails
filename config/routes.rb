Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
  get '/hotels/new', to: 'hotels#new'
  post '/hotels', to: 'hotels#create'
  get '/hotels/:id/edit', to: 'hotels#edit'
  patch '/hotels/:id', to: 'hotels#update'
end
