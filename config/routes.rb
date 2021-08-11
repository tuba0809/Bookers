Rails.application.routes.draw do
  get 'homes/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'books#top'
  post 'homes' => 'homes#create'
  get 'homes' => 'homes#index'
  get 'homes/:id' => 'homes#show', as: 'home'
  get 'homes/:id/edit' => 'homes#edit', as:'edit_home'
  patch 'homes/:id' => 'homes#update', as:'update_home'
end
