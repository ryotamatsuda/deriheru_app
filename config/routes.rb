Rails.application.routes.draw do
  root 'home#top'

  devise_for :admins, skip: ['registrations','passwords'], :controllers => {
    :sessions => 'admins/sessions'
  }
  namespace :admins do
    resources :operators
  end

  devise_for :operators, skip: ['registrations','passwords'], :controllers => {
    :sessions => 'operators/sessions'
  }
  devise_scope :operator do
    get '/operators/edit' => 'operators/registrations#edit', as: 'edit_operator_registration'
    put '/operators' => 'operators/registrations#update', as: 'operator_registration'
  end
  namespace :operators do
    get '/orders/new_first_time' => 'orders#new_first_time', as: 'new_first_time_order'
    post '/orders/create_first_time' => 'orders#create_first_time', as: 'create_first_time_order'
    get '/orders/new_secound_time' => 'orders#new_secound_time', as: 'new_secound_time_order'
    post '/orders/create_secound_time' => 'orders#create_secound_time', as: 'create_secound_time_order'
    resources :orders, only: [:index, :show, :edit, :update]
    resources :customers
  end
end
