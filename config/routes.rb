Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: "json" }
  namespace :api, format: 'json' do
    resources :tasks, except: %i[new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
