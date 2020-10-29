# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cardsets do
    resources :cards, except: [:index, :show]

    get "/presentation", controller: "presentation", action: "show"
  end

  resources :categories, except: :show

  root to: redirect("/cardsets")
end

# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                         cardset_cards POST   /cardsets/:cardset_id/cards(.:format)                                                    cards#create
#                      new_cardset_card GET    /cardsets/:cardset_id/cards/new(.:format)                                                cards#new
#                     edit_cardset_card GET    /cardsets/:cardset_id/cards/:id/edit(.:format)                                           cards#edit
#                          cardset_card PATCH  /cardsets/:cardset_id/cards/:id(.:format)                                                cards#update
#                                       PUT    /cardsets/:cardset_id/cards/:id(.:format)                                                cards#update
#                                       DELETE /cardsets/:cardset_id/cards/:id(.:format)                                                cards#destroy
#                  cardset_presentation GET    /cardsets/:cardset_id/presentation(.:format)                                             presentation#show
#                              cardsets GET    /cardsets(.:format)                                                                      cardsets#index
#                                       POST   /cardsets(.:format)                                                                      cardsets#create
#                           new_cardset GET    /cardsets/new(.:format)                                                                  cardsets#new
#                          edit_cardset GET    /cardsets/:id/edit(.:format)                                                             cardsets#edit
#                               cardset GET    /cardsets/:id(.:format)                                                                  cardsets#show
#                                       PATCH  /cardsets/:id(.:format)                                                                  cardsets#update
#                                       PUT    /cardsets/:id(.:format)                                                                  cardsets#update
#                                       DELETE /cardsets/:id(.:format)                                                                  cardsets#destroy
#                            categories GET    /categories(.:format)                                                                    categories#index
#                                       POST   /categories(.:format)                                                                    categories#create
#                          new_category GET    /categories/new(.:format)                                                                categories#new
#                         edit_category GET    /categories/:id/edit(.:format)                                                           categories#edit
#                              category PATCH  /categories/:id(.:format)                                                                categories#update
#                                       PUT    /categories/:id(.:format)                                                                categories#update
#                                       DELETE /categories/:id(.:format)                                                                categories#destroy
#                                  root GET    /                                                                                        redirect(301, /cardsets)
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
