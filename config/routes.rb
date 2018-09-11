Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  resources :users do
      resources :user_books
  end
  resources :books
  resources :reviews
  resources :comments

  get '/home' => 'static_pages#home'
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/signin' => 'sessions#new'
  post '/SignIn' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  post '/createUserBook' => 'user_books#create'

end
