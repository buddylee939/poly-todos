Rails.application.routes.draw do
  resources :todo_items
  resources :todo_lists
  get 'my_todos', to: 'todo_items#my_todos'
  get 'completed_todos', to: 'todo_items#completed_todos'
  root 'todo_lists#index'
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '*path' => redirect('/')
end
