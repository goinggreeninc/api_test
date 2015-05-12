require 'api_constraints'

TopTalTimeZones::Application.routes.draw do
 

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    	 devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
      resources :cats
    end
  end
end
