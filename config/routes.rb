Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'









  get '/pediatricians', to: 'pediatricians#index'
  get '/pediatricians/:id', to: 'pediatricians#show'
  get '/patients', to: 'patients#index'
  get '/patients/:id', to: 'patients#show'
end
