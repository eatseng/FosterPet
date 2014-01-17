FosterPet::Application.routes.draw do
  get "/home", :to => "static_pages#home"
  get "/contact", :to => "static_pages#contact"
  get "/about", :to => "static_pages#about"


  resources :users, :only => [:index, :create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]

  resources :pets do
    resources :followings, :only => [:create, :destroy]
  end

  resources :posts, :only => [:index, :create, :destroy]

  root :to => "static_pages#root"
  #root :to => "users#show"
end
