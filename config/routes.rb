Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: "public/registrations",
      sessions: "public/sessions"
    }

    root to: 'homes#top'
    get 'homes/about', as: 'about'
  scope module: :public do
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

  resource :map, only: [:show]
end
