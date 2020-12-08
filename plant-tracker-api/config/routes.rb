Rails.application.routes.draw do
  get "/external", to: "external#show"
  get "/ping", to: "health#ping"
end
