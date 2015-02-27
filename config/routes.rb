Rails.application.routes.draw do

  resources :cardsets do
    resource :cards
  end

  resource :categories

  root "cardsets#index"

end
