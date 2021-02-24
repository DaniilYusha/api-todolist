Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resource :sessions, only: [:create, :destroy]
        # post '', action: :create, controller: 'registrations'
        # post 'sign_in', action: :create, controller: 'sessions'
        # delete 'sing_out', action: :destroy, controller: 'sessions', defaults: { id: nil }
      end

      resources :projects do
        resources :tasks, only: [:index, :create]
      end

      resources :tasks, only: [:show, :update, :destroy] do
        member do
          put 'position'
          put 'complete'
        end
      end
    end
  end
end
