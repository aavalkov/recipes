Rails.application.routes.draw do
  match('/', {via: :get, to: 'recipes#index'})
  match('/recipes/new', {via: :get, to: 'recipes#new'})
  match('/recipes', {via: :post, to: 'recipes#create'})
  match('/recipes/:id', {via: :get, to: 'recipes#show'})
  match('/recipes/:id/edit', {via: :get, to: 'recipes#edit'})
  match('/recipes/:id', {via: [:patch, :put], to: 'recipes#update'})
  match('/recipes/:id', {via: :delete, to: 'recipes#destroy'})

  match('/tags/new', {via: :get, to: 'tags#new'})
  match('/tags', {via: :post, to: 'tags#create'})
  match('/tags/:id', {via: :get, to: 'tags#show'})
end
