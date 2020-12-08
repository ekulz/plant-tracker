Rails.application.routes.draw do
  scope "/api" do
    get "/external", to: "external#show"
    get "/ping", to: "health#ping"
  end
end
