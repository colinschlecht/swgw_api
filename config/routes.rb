Rails.application.routes.draw do
  resources :characters
  resources :species
  resources :homeworlds
  resources :character_questions
  resources :questions
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
