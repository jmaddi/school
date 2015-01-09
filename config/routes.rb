Rails.application.routes.draw do

  namespace :api, :defaults => { :format => :json } do
    resources :enrollments
    resources :courses
  end

  match '*path', to: 'pages#index' , via: [:get]

end
