FosterPet::Application.routes.draw do
  get "/home", :to => "static_pages#home"
  get "/contact", :to => "static_pages#contact"
  get "/about", :to => "static_pages#about"

  get "/feeds", :to => "posts#feeds"
  resources :users, :only => [:index, :create, :new, :show] do
    get "userwall", :to => "posts#userwall"
  end
  resource :session, :only => [:create, :destroy, :new]

  resources :pets do
    get "petwall", :to => "posts#petwall"
    resources :followings, :only => [:create, :destroy]
    resources :testimonials, :only => [:index, :create]
 end

  resources :posts, :only => [:index, :create, :destroy]
  resources :testimonials, :only => [:destroy]

  root :to => "static_pages#root"
  #root :to => "users#show"
end
