# frozen_string_literal: true

RSpec.describe "Create category" do
  subject { create_category(params) }

  let(:params) { { category: { title: "My category", color: "teal" } } }

  it { is_expected.to redirect_to categories_path }

  def create_category(params = nil)
    post categories_path, params: params
  end
end
