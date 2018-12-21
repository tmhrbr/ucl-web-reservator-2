Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :buildings do
    resources :rooms do
      resources :schedules
    end
  end

  resources :rooms

  namespace :admin do
    root :to => "dashboards#index"
    resources :dashboards, :buildings, :rooms, :students, :teachers, :lessons
  end

  root to: 'buildings#index'
end
