require 'rails_helper'

RSpec.describe Equipment, type: :model do
  before do
    @equipment = FactoryBot.build(:equipment)
  end

  it "has a valid factory" do
    expect(@equipment).to be_valid
  end
end
