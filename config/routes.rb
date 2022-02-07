Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/hotels', to:'hotels#index'
  get '/suites', to: 'suites#index'
  get 'hotel/:id', to:'hotels#show'
  get '/suite/:id', to: 'suites#show'
  get '/hotel/:id/suites', to:'hotel_suites#index'
  get '/hotels/new', to: 'hotels#new'
  post '/hotels', to: 'hotels#create'
  get '/hotels/:id/edit', to: 'hotels#edit'
  patch '/hotels/:id', to: 'hotels#update'
  post '/hotels/', to: 'hotels#create'
  get 'hotels/:id/new', to: 'suites#new'
end
