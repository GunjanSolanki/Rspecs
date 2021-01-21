require 'rails_helper'

RSpec.describe JobCard, type: :model do
  before do
    @job_card = FactoryBot.build(:job_card)
  end

  it "has a valid factory" do
    expect(@job_card).to be_valid
  end
end
