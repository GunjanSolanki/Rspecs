require 'rails_helper'

RSpec.describe ReportSignature, type: :model do
  before do
    @report_signature = FactoryBot.build(:report_signature)
  end

  it "has a valid factory" do
    expect(@report_signature).to be_valid
  end
end
