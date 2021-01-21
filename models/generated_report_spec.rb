require 'rails_helper'

RSpec.describe GeneratedReport, type: :model do
  before do
    @generated_report = FactoryBot.build(:generated_report)
  end

  it "has a valid factory" do
    expect(@generated_report).to be_valid
  end
end
