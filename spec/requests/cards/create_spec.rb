# frozen_string_literal: true

RSpec.describe "Create card" do
  subject { create_card(cardset.id, params) }

  let(:category) { create(:category) }
  let(:cardset) { create(:cardset) }
  let(:params) { { card: { question: "My question", answer: "My answer", category_id: category.id } } }

  it { is_expected.to redirect_to cardset_path(cardset.id) }

  def create_card(cardset_id, params = nil)
    post cardset_cards_path(cardset_id: cardset_id), params: params
  end
end
