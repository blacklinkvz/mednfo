Rails.application.routes.draw do
  resources :medicaments
  resources :articles
  resources :contacts
  resources :destinies

  devise_for :users, controllers:{ registrations: 'user/registrations'}

  root to: "main#home"

  resources :travels do
    resources :destinies
  end
end
