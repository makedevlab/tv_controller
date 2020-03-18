Rails.application.routes.draw do
  resources :chores do
    member do
      get :toggle_complete
      put :toggle_complete
    end
  end
  resources :tasks
  resources :children do
    resources :chores, only: [:index]
  end
  resource :dashboard, only: :show, controller: :dashboard
  resource :tv, only: :show, controller: :tv

  root to: "dashboard#show"
end
