Rails.application.routes.draw do
  draw :madmin
  root controller: :home, action: :index

  namespace :api do
    resources :photographs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
