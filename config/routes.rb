Rails.application.routes.draw do
  resources :links
  root "links#index"
end
