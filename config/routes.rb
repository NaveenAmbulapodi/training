Rails.application.routes.draw do

  resources :schools
  # devise_for :users
  get 'students/aboutus'
  get 'students/contact'
  get 'students/latest'
  resources :students do
    member do
      get 'download_pdf'
    end
  end
  
   root to: "students#home"
   namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :students
       resources :schools
      end
    end
    
devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: "callbacks"}


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
