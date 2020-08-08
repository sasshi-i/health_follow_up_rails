Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "health_check#health_check"

  post "/answers", to: "answers#create"
  patch "/answers", to: "answers#update"
  delete "/answers", to: "answers#destroy"

  get "/users", to: "users#index"
  get "/users/:discloseId", to: "users#show"
end
