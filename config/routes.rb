Rails.application.routes.draw do

  get "/meals", to: "meals#index"
  get "/meals/:id", to: "meals#show"
  post "/meals", to: "meals#create"
  put "/meals/:id", to: "meals#update"
  delete "/meals/:id", to: "meals#destroy"

end
