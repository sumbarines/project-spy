TrackApp::Application.routes.draw do


  devise_for :users
  
  resources :projects
  
  root 'welcome#index'
end
