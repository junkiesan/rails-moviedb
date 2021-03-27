Rails.application.routes.draw do
  get 'pages/home'
  resources :movies, only: :index
end
