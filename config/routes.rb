Rails.application.routes.draw do

  resources :cardsets do
    resources :cards
    resources :categories, only: [:show], :controller => "presentation", :action => "show"
  end

  resources :categories

  root :to => redirect('/cardsets')

end
