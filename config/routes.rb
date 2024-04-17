Rails.application.routes.draw do
  # get 'services/index'
  # get 'services/new'

  # get 'clients/new'
  # get 'clients/index'
  get 'clients/serv'
  resources :clients do
    resources :services, exept: :index
    resources :tickets
  end
  get 'services', to: 'services#index'

  devise_for :users

  get 'servicios', to: 'statics#services'
  get 'preguntas_frecuentes', to: 'statics#frequent_questions'
  get 'contáctanos', to: 'statics#contact'
  get 'nosotros', to: 'statics#about_us'

  get 'inicio', to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end