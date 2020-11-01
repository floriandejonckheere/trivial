# frozen_string_literal: true

RSpec.describe "Create category" do
  subject { create_category(params) }

  let(:params) { { category: { title: "My category", color: "teal" } } }

  let(:user) { create(:user) }

  before { sign_in user }

  it { is_expected.to redirect_to categories_path }

  def create_category(params = nil)
    post categories_path, params: params
  end
end
