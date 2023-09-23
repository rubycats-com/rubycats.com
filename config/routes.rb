Rails.application.routes.draw do
  get "/up", to: Proc.new { [200, {}, ["OK"]] }

  # Defines the root path route ("/")
  # root "articles#index"
end
