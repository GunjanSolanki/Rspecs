require 'rails_helper'

RSpec.describe CalendarItem, type: :model do
  before do
    @calendar_item = FactoryBot.build(:calendar_item)
  end

  it "has a valid factory" do
    expect(@calendar_item).to be_valid
  end
end
