Rails.application.routes.draw do
  devise_for :users
  root "members#index"
  resources :users, only: [:edit, :update]
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
