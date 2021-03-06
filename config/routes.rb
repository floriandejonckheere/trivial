# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :cardsets do
    resources :cards, except: [:index, :show]

    get :presentation, to: "presentations#show"
  end

  resources :presentations, only: :index
  resources :categories, except: :show

  namespace :api do
    resources :cardsets, only: :show
    resources :categories, only: :index
  end

  root to: redirect("/presentations")
end

# == Route Map
#
#               Prefix Verb   URI Pattern                                    Controller#Action
#     new_user_session GET    /users/sign_in(.:format)                       devise/sessions#new
#         user_session POST   /users/sign_in(.:format)                       devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)                      devise/sessions#destroy
#        cardset_cards POST   /cardsets/:cardset_id/cards(.:format)          cards#create
#     new_cardset_card GET    /cardsets/:cardset_id/cards/new(.:format)      cards#new
#    edit_cardset_card GET    /cardsets/:cardset_id/cards/:id/edit(.:format) cards#edit
#         cardset_card PATCH  /cardsets/:cardset_id/cards/:id(.:format)      cards#update
#                      PUT    /cardsets/:cardset_id/cards/:id(.:format)      cards#update
#                      DELETE /cardsets/:cardset_id/cards/:id(.:format)      cards#destroy
# cardset_presentation GET    /cardsets/:cardset_id/presentation(.:format)   presentations#show
#             cardsets GET    /cardsets(.:format)                            cardsets#index
#                      POST   /cardsets(.:format)                            cardsets#create
#          new_cardset GET    /cardsets/new(.:format)                        cardsets#new
#         edit_cardset GET    /cardsets/:id/edit(.:format)                   cardsets#edit
#              cardset GET    /cardsets/:id(.:format)                        cardsets#show
#                      PATCH  /cardsets/:id(.:format)                        cardsets#update
#                      PUT    /cardsets/:id(.:format)                        cardsets#update
#                      DELETE /cardsets/:id(.:format)                        cardsets#destroy
#        presentations GET    /presentations(.:format)                       presentations#index
#           categories GET    /categories(.:format)                          categories#index
#                      POST   /categories(.:format)                          categories#create
#         new_category GET    /categories/new(.:format)                      categories#new
#        edit_category GET    /categories/:id/edit(.:format)                 categories#edit
#             category PATCH  /categories/:id(.:format)                      categories#update
#                      PUT    /categories/:id(.:format)                      categories#update
#                      DELETE /categories/:id(.:format)                      categories#destroy
#          api_cardset GET    /api/cardsets/:id(.:format)                    api/cardsets#show
#       api_categories GET    /api/categories(.:format)                      api/categories#index
#                 root GET    /                                              redirect(301, /presentations)
