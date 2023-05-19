require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get '/snapshots/should_retain', to: 'snapshots#should_retain'
      post '/snapshots/should_retain', to: 'snapshots#create'
    end
  end
end
