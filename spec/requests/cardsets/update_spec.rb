# frozen_string_literal: true

RSpec.describe "Create cardset" do
  subject { update_cardset(cardset.id, params) }

  let(:cardset) { create(:cardset) }
  let(:params) { { cardset: { title: "My cardset" } } }

  let(:user) { create(:user) }

  before { sign_in user }

  it { is_expected.to redirect_to cardsets_path }

  def update_cardset(id, params = nil)
    patch cardset_path(id), params: params
  end
end
