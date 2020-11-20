Rails.application.routes.draw do
  root to: "cockails#index"
  resources :cocktails, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :doses, only: [:create, :new]
  end
  resources :doses, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
