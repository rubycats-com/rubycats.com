Rails.application.routes.draw do
  # Root path is set to "articles#home" by HighVoltage

  get "/up", to: proc { [200, {}, ["OK"]] }
  get "/articles", to: redirect("/")
end
