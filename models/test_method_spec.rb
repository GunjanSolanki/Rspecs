require 'rails_helper'

RSpec.describe TestMethod, type: :model do
  before do
    @test_method = FactoryBot.build(:test_method)
  end

  it "has a valid factory" do
    expect(@test_method).to be_valid
  end
end
