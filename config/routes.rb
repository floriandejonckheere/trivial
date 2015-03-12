Rails.application.routes.draw do

  resources :cardsets do
    resources :cards do
      get 'toggle_visible', :on => :member
    end
    resources :categories do
      get '/', :controller => "presentation", :action => "show"
      get 'toggle_visible', :on => :member, :controller => "cardsets"
    end
  end

  resources :categories

  root :to => redirect('/cardsets')

end
