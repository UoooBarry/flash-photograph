# Below are the routes for madmin
namespace :madmin do
  resources :photographs
  resources :devices
  root to: "dashboard#show"
end
