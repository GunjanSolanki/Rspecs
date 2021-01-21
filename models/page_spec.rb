require 'rails_helper'

RSpec.describe Page, type: :model do
  before do
    @page = FactoryBot.build(:page)
  end

  it "has a valid factory" do
    expect(@page).to be_valid
  end
end
