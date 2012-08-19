FacebookTestbed::Application.routes.draw do
  root :to => "home#index"

  resources :users, :only => [ :show, :edit, :update ]
  resources :products do
    member { get :movable_ink }
  end
  resources :purchases

  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end
