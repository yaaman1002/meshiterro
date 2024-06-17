Rails.application.routes.draw do
  scope module: :public do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', as: 'about'
  resources :post_images, only:[:new, :create, :index, :show, :destroy] do
    resource :favorite, only:[:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
   end
    resources :users, only: [:show, :edit, :update]
  end
    devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboarde#index'
    resources :users, only:[:destroy]
  end
end
