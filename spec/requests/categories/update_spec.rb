# frozen_string_literal: true

RSpec.describe "Create category" do
  subject { update_category(category.id, params) }

  let(:category) { create(:category) }
  let(:params) { { category: { title: "My category", color: "teal" } } }

  let(:user) { create(:user) }

  before { sign_in user }

  it { is_expected.to redirect_to categories_path }

  def update_category(id, params = nil)
    patch category_path(id), params: params
  end
end
