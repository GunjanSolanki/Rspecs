require 'rails_helper'

RSpec.describe AcceptanceCriteriaTestMethod, type: :model do
  before do
    @acceptance_criteria_test_method = FactoryBot.build(:acceptance_criteria_test_method)
  end

  it "has a valid factory" do
    expect(@acceptance_criteria_test_method).to be_valid
  end
end
