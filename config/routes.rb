WebrockitUi::Application.routes.draw do
  root :to => "base#index"

  #check management
  resources :checks
  resources :types
  resources :pollers
  resources :checksync

  #display controllers
  resources :displaylist
  resources :graphexplorer
  resources :spotcheck

  #show data from graphite
  resources :metrics
  
end
