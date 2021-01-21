require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before do
    @invoice = FactoryBot.build(:invoice)
  end

  it "has a valid factory" do
    expect(@invoice).to be_valid
  end
end
