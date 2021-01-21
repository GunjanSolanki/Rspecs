require 'rails_helper'

RSpec.describe RadiographyExposure, type: :model do
  before do
    @radiography_exposure = FactoryBot.build(:radiography_exposure)
  end

  it "has a valid factory" do
    expect(@radiography_exposure).to be_valid
  end
end
