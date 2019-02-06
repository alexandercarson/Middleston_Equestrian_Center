Rails.application.routes.draw do
  get 'medications/index'
  get 'medications/show'
  get 'medications/edit'
  get 'medications/destroy'
  get 'medications/new'
  default_url_options :host => "localhost"

  devise_for :users
    resources :users, except: [:destroy] do
    resources :horses
    resources :charges, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :problems
    resources :notes, only: [:index, :show]
    resources :coggins, only: [:index, :show]
    resources :issues, only: [:show]


  end

  resources :horses do
    resources :users, only: [:show]
    resources :charges, except: [:index, :show]
    resources :events, except: [:index, :show]
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
  resources :charges
  resources :events
  resources :problems
  resources :coggins
  resources :issues
  resources :medications





  root 'users#new'
end
