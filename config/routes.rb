TopTalTimeZones::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  resources :cats, :defaults => { :format => 'json'}
end
