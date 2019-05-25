Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks do
    resources :subtasks do
      member do
        patch :complete
      end
    end
    collection do
      get :personal_index
    end
  end

  # Homepage
  root 'tasks#personal_index'
end
