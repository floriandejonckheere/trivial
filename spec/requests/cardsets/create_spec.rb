# frozen_string_literal: true

RSpec.describe "Create cardset" do
  subject { create_cardset(params) }

  let(:params) { { cardset: { title: "My cardset" } } }

  let(:user) { create(:user) }

  before { sign_in user }

  it { is_expected.to redirect_to cardsets_path }

  def create_cardset(params = nil)
    post cardsets_path, params: params
  end
end
