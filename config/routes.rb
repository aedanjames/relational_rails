Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/hotels', to:'hotels#index'
  get '/mma_organizations', to:'organizations#index'
  get '/fighters', to:'fighters#index'
end
