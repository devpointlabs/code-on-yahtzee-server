Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth', controllers: {
    registrations:  'api/registrations',
    sessions:  'api/sessions'
  }

  namespace :api do
    get '/yahtzee_scores', to: 'yahtzee#index'
    post '/yahtzee_scores', to: 'yahtzee#create'
  end
end