Rails.application.routes.draw do

  resources :cardsets do
    resources :cards, :except => [:index, :show] do
      get 'toggle_visible', :on => :member
    end

    get '/presentation', :controller => "presentation", :action => "show"

    resources :categories, :only => ['toggle_visible'] do
      get 'toggle_visible', :on => :member, :controller => "cardsets"
    end
  end

  resources :categories, :except => :show

  root :to => redirect('/cardsets')

end
