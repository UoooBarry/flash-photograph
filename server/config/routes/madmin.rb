# Below are the routes for madmin
namespace :madmin do
  resources :devices
  resources :photographs
  resources :vieweds
  root to: "dashboard#show"
end
