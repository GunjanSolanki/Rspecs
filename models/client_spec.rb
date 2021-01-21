require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryBot.build(:client)
  end

  it "has a valid factory" do
    expect(@client).to be_valid
  end

  it "is invalid without a name" do
    client = FactoryBot.build(:client, name: nil)
    client.valid?
    expect(client.errors[:name]).to include("can't be blank")
  end
end
