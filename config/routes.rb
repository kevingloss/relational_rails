Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/:id', to: 'authors#show'
  post '/authors', to: 'authors#create'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  delete '/authors/:id', to: 'authors#destroy'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'

  get '/authors/:author_id/books', to: 'author_books#index'
  get '/authors/:author_id/books/new', to: 'author_books#new'
  post '/authors/:author_id/books', to: 'author_books#create'









  get '/pediatricians', to: 'pediatricians#index'
  get '/pediatricians/new', to: 'pediatricians#new'
  get '/pediatricians/:id', to: 'pediatricians#show'
  get '/pediatricians/:id/edit', to: 'pediatricians#edit'
  get '/patients', to: 'patients#index'
  get '/patients/:id', to: 'patients#show'
  get '/pediatricians/:id/patients', to: 'pediatrician_patients#index'
  get '/pediatricians/:id/patients/new', to: 'pediatrician_patients#new'
  get '/patients/:id/edit', to: 'patients#edit'

  post '/pediatricians', to: 'pediatricians#create'
  patch '/pediatricians/:id', to: 'pediatricians#update'

  post '/pediatricians/:pediatrician_id/patients', to: 'pediatrician_patients#create'
  patch '/patients/:id', to: 'patients#update'

  delete '/pediatricians/:id', to: 'pediatricians#destroy'
  delete '/patients/:id', to: 'patients#destroy'



end
