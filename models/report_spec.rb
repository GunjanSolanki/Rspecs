require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryBot.build(:report)
  end

  it "has a valid factory" do
    expect(@report).to be_valid
  end
end
