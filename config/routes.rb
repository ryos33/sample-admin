Rails.application.routes.draw do
  root :to => 'dashboard#show'

  devise_for :admins, path: '', only: nil
  devise_scope :admin do
    get 'login', to: 'admins/sessions#new', as: 'new_admin_session'
    post 'login', to: 'admins/sessions#create', as: 'admin_session'
    delete 'logout', to: 'admins/sessions#destroy', as: nil
    get 'logout', to: 'admins/sessions#destroy', as: 'destroy_admin_session'

    get 'me/edit', to: 'admins/registrations#edit', as: 'edit_admin_registration'
    patch 'me/edit', to: 'admins/registrations#update', as: nil
    put 'me/edit', to: 'admins/registrations#update', as: nil

    get 'password/forget', to: 'admins/passwords#new', as: 'new_admin_password'
    post 'password/forget', to: 'admins/passwords#create', as: nil
    get 'password/sent', to: 'admins/passwords#sent', as: 'sent_admin_password'
    get 'password/reset', to: 'admins/passwords#edit', as: 'edit_admin_password'
    patch 'password/reset', to: 'admins/passwords#update', as: 'admin_password'
    put 'password/reset', to: 'admins/passwords#update', as: nil
    get 'password', to: redirect('mypage'), as: nil
    get 'password/reset_completed', to: 'admins/passwords#reset_completed', as: 'reset_completed_admin_password'
  end
end
