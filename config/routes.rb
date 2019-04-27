Rails.application.routes.draw do
  default_url_options :host => "localhost"

  devise_for :users
    resources :users, except: [:destroy] do
    resources :horses
    resources :charges, only: [:index, :show]
    resources :events
    resources :problems
    resources :notes, only: [:index, :show]
    resources :coggins, only: [:index, :show]
    resources :issues, only: [:show]
    resources :medications, only: [:index, :show]
    resources :plans do
      resources :subscriptions
    end
    mount StripeEvent::Engine, at: '/stripe_events'
  end

  resources :horses do
    resources :users, only: [:show]
    resources :events
    resources :problems, except: [:index, :show]
    resources :veternarians, only: [:show]
    resources :farriers, only: [:show]
    resources :notes, only: [:index, :show]
    resources :coggins, except: [:index, :show]
    resources :issues
    resources :medications

  end

  resources :farriers
  resources :veterinarians
  resources :notes
  resources :events
  resources :problems
  resources :coggins
  resources :issues
  resources :medications
  resources :charges


  get '/horses/:user_id', to: 'problems#problems'
  root 'users#new'
end

