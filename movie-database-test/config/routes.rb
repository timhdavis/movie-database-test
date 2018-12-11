Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  get 'movies/show' # So can view a movie through API, but not yet added to the database.

  # Resources: (maps HTTP verbs to Controller actions)

  resources :movies
  resources :reviews
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
