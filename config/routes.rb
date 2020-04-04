# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :products
    end
  end
end
