Rails.application.routes.draw do
  # Root path is set to "articles#home" by HighVoltage
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }
  get "/up", to: proc { [200, {}, ["OK"]] }

  get "/up", to: proc { [200, {}, ["OK"]] }
  get "/articles", to: redirect("/")
end
