Rails.application.routes.draw do
  scope "/api" do
    get "/external", to: "external#show"
    get "/ping", to: "health#ping"

    resources :plants, only: [:index, :show, :create]
  end
end
