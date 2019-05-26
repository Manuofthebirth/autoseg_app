Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    resources :subtasks do
      member do
        patch :complete
      end
    end
    # Pages for your favorites and another for your tasks
    collection do
      get :personal_index
      get :favorite_index
    end
  end

  # Homepage - your tasks
  root 'tasks#personal_index'
end
