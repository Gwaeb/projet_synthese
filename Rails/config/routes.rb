Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: "angular#index"
  namespace :api, constraints: { format: 'json' }  do
    resources :skins, :items, :runes, only: [:index, :show]
    resources :champions, only: [:index, :show] do
      resources :skins, shallow: true, only: [:index, :show]
    end
    resources :categories, only: [:index, :show] do
      resources :runes, shallow: true, only: [:index, :show]
    end
    get 'user', to: "user#show"
    get 'user/:id', to: "user#desc"

    get 'pending/plannings', to: "plannings#pending"
    post 'pending/plannings/:id/accept', to: "plannings#accept"
    post 'pending/plannings/:id/deny', to: "plannings#deny"

    get '/rapports/1', to: "rapports#champions"
    get '/rapports/2', to: "rapports#runes"
    get '/rapports/3', to: "rapports#plannings"

    resources :builds, :build_has_items, :match_histories, :champion_wishlists, :skin_wishlists, :rune_pages, :runes_has_runes_pages, :friends, :friends_has_plannings, :plannings



  end

 

  match '*url', to: "angular#index", via: :get

end
