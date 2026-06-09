Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "articles#index"

  # TRADE-OFF NOTE (Explicit Routes vs Resource Routing Macro):
  # Instead of declaring individual endpoints manually for every single action:
  #   get "/articles", to: "articles#index"
  #   get "/articles/:id", to: "articles#show"
  #
  # We embrace 'resources :articles'.
  # Pros: Generates all 7 standard RESTful routes (index, show, new, create, edit, update, destroy)
  #       along with their respective URL path/url helpers in a single line.
  # Cons: Implies less explicit visibility in this file, but aligns with canonical Rails conventions.
  resources :articles do
    resources :comments
  end
  
  get "/api/comments", to: "comments#api_index"
  get "/api/comments_not_empty", to: "comments#api_index_not_empty"
  get "/api/comments_without_body", to: "comments#api_index_without_body"
  get "/api/comments_without_commenter", to: "comments#api_index_without_commenter"
  get "/api/comments_incomplete", to: "comments#api_index_incomplete"
end
