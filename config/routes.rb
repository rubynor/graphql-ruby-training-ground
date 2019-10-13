Rails.application.routes.draw do
  devise_for :users
  if Rails.env.development?
    authenticated :user do
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    end
    unauthenticated :user do
      get '/graphiql', to: redirect('/users/sign_in')
    end
  end
  post "/graphql", to: "graphql#execute"
  root to: redirect("/graphiql")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
