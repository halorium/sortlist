Rails.application.routes.draw do

  root 'application#index'

  namespace 'api' do
    resources :agencies, only: [:index, :create], defaults: {format: :json}
  end

  get '*path', to: 'application#index'
end
