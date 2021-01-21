require 'rails_helper'

RSpec.describe Procedure, type: :model do
  before do
    @procedure = FactoryBot.build(:procedure)
  end

  it "has a valid factory" do
    expect(@procedure).to be_valid
  end
end
