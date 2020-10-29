# frozen_string_literal: true

RSpec.describe Category do
  it { is_expected.to have_many(:cards).dependent :destroy }

  it { is_expected.to validate_presence_of :title }

  it { is_expected.to validate_presence_of :color }
  it { is_expected.to validate_inclusion_of(:color).in_array described_class::COLORS }
end
