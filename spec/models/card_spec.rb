# frozen_string_literal: true

RSpec.describe Card do
  it { is_expected.to belong_to :category }
  it { is_expected.to belong_to :cardset }

  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_presence_of :answer }
end
