require 'rails_helper'

RSpec.describe IdAndCover, type: :model do
  before do
    @id_and_cover = FactoryBot.build(:id_and_cover)
  end

  it "has a valid factory" do
    expect(@id_and_cover).to be_valid
  end
end
