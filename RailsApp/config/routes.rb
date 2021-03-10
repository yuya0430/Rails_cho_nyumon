Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :mycontacts
  get 'messages/index'
  get 'messages', to: 'messages#index'

  get 'messages/add'
  post 'messages/add', to: 'messages#create'

  get 'messages/edit/:id', to: 'messages#edit'
  patch 'messages/edit/:id', to: 'messages#update'

  get 'messages/delete/:id', to: 'messages#delete'
  get 'messages/:id', to: 'messages#show'
  get 'cards/index'
  get 'cards', to: 'cards#index'

  get 'cards/show'

  get 'cards/add'
  post 'cards/add'

  get 'cards/:id', to: 'cards#show'

  get 'cards/edit/:id', to: 'cards#edit'
  patch 'cards/edit/:id', to: 'cards#edit'

  get 'cards/delete/:id', to: 'cards#delete'

  get 'people/index'
  get 'msgboard', to: 'msgboard#index'
  post 'msgboard', to: 'msgboard#index'
  get 'msgboard/index'
  post 'msgboard/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index'
  get 'hello', to: 'hello#index'
  get 'hello/other'
  post 'hello', to: 'hello#index'
  post 'hello/index'

  get 'people', to: 'people#index'
  get 'people/add'
  post 'people/add', to: 'people#create'

  get 'people/edit/:id', to: 'people#edit'
  post 'people/edit/:id', to: 'people#update'
  patch 'people/edit/:id', to: 'people#update'

  get 'people/delete/:id', to: 'people#delete'

  get 'people/find'
  post 'people/find'

  get 'people/:id', to: 'people#show'
end
