Rails.application.routes.draw do

  
  resources :profiles do
    resources :originals
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    root :to => "users/sessions#new"
  end


  resources :users,only: [:index,:show,:edit,:update,:destroy] do
    resources :questions,only: [:show,:new,:create, :update,:edit]
    resources :answers,only: [:create,:edit,:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
