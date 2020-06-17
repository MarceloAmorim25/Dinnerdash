Rails.application.routes.draw do

  get "/meals", to: "meals#index"
  get "/meals/:id", to: "meals#show"

end
