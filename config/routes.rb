  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root("welcome#index")

  resources(:users) do
    resources(:movies) do
      resources(:viewing_parties)
    end

    get("/discover",     to: "discover#index")
  end

  get("/register",   to: "users#new")
  post("/register",   to: "users#create")
  get("/login",   to: "sessions#new")
  post("/login",   to: "sessions#create")
  delete("/logout",   to: "sessions#destroy")
end
