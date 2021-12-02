Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors/:author_id/books', to: 'author_books#index'










  get '/pediatricians', to: 'pediatricians#index'
  get '/pediatricians/:id', to: 'pediatricians#show'
  get '/patients', to: 'patients#index'
  get '/patients/:id', to: 'patients#show'
  get '/pediatrician/:id/patients', to: 'pediatrician_patients#index'


end
