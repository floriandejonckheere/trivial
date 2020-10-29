# frozen_string_literal: true

RSpec.describe Cardset do
  it { is_expected.to have_many(:cards).dependent :destroy }

  it { is_expected.to validate_presence_of :title }
end
