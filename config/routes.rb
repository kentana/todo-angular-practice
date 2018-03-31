Rails.application.routes.draw do
  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # put
  put 'todos/:id/star', to: 'todos#star'
  put 'todos/:id/unstar', to: 'todos#unstar'
  put 'todos/:id/done', to: 'todos#done'
  put 'todos/:id/undone', to: 'todos#undone'

  # patch
  patch 'todos/:id/star', to: 'todos#star'
  patch 'todos/:id/unstar', to: 'todos#unstar'
  patch 'todos/:id/done', to: 'todos#done'
  patch 'todos/:id/undone', to: 'todos#undone'

  # docs
  get 'docs', to: 'docs#index'
end
