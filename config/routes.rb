Rails.application.routes.draw do
  get "/up", to: proc { [200, {}, ["OK"]] }

  devise_for :users, controllers: {omniauth_callbacks: :callbacks}

  # Root path is set to "pages#home" by HighVoltage
  get "/pages", to: redirect("/")

  resource :under_construction, only: [:show]

  resources :pages, only: [] do
    resource :like, module: "pages", only: [:create, :destroy]
  end
end
