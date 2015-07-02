Rails.application.routes.draw do

  root 'application#index'

  namespace 'api' do
    get 'agencies', to: 'agencies#index', defaults: {format: :json}
    post 'agencies', to: 'agencies#create', defaults: {format: :json}
  end

  get '*path', :to => 'application#index'
end
