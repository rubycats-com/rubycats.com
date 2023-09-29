Rails.application.routes.draw do
  get "/up", to: proc { [200, {}, ["OK"]] }

  devise_for :users, controllers: {omniauth_callbacks: :callbacks}

  # Root path is set to "articles#home" by HighVoltage
  get "/pages", to: redirect("/")
end
