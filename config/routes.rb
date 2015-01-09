Rails.application.routes.draw do

  namespace :api, :defaults => { :format => :json } do
    resources :enrollments
    resources :courses
    resources :students, :only => [ :index ]
  end

  match '*path', to: 'pages#index' , via: [:get]
  root 'pages#index'

end
