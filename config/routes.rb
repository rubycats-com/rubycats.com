Rails.application.routes.draw do
  get "/up", to: proc { [200, {}, ["OK"]] }

  # Defines the root path route ("/")
  root "pages#index"
end
