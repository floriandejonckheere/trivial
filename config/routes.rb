Rails.application.routes.draw do

  resources :cardsets do
    resources :cards, :except => [:index, :show]

    get '/presentation', :controller => "presentation", :action => "show"
  end

  resources :categories, :except => :show

  root :to => redirect('/cardsets')

end
