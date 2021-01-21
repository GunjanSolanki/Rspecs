require 'rails_helper'

RSpec.describe SignatureRequirement, type: :model do
  before do
    @signature_requirement = FactoryBot.build(:signature_requirement)
  end

  it "has a valid factory" do
    expect(@signature_requirement).to be_valid
  end
end
