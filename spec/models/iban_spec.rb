require 'rails_helper'

RSpec.describe Iban, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to allow_value("GB33BUKB20201555555555").for(:number) }
  it "Iban with wrong checksum fails validation" do
    is_expected.not_to allow_value("GB33BUKB20201555555544").for(:number)
  end
  it "Iban with unknown country code fails validation" do
    skip("TODO: Implement iban number country code validation")
    is_expected.not_to allow_value("XX33BUKB20201555555555").for(:number)
  end
end

