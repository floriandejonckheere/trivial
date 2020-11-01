# frozen_string_literal: true

RSpec.describe "Create card" do
  subject { update_card(card.id, card.cardset.id, params) }

  let(:card) { create(:card) }
  let(:params) { { card: { question: "My question" } } }

  let(:user) { create(:user) }

  before { sign_in user }

  it { is_expected.to redirect_to cardset_path(card.cardset.id) }

  def update_card(id, cardset_id, params = nil)
    patch cardset_card_path(cardset_id: cardset_id, id: id), params: params
  end
end
