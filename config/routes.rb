Rails.application.routes.draw do

  resources :schools
  # devise_for :users
  resources :students do
    member do
      get 'download_pdf'
    end
  end
   root to: "students#index"
   namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :students
       resources :schools
      end
    end
    devise_for :users, controllers: {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
