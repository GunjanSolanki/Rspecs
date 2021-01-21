require 'rails_helper'

RSpec.describe TaskSpecificEmailSetup, type: :model do
  before do
    @task_specific_email_setup = FactoryBot.build(:task_specific_email_setup)
  end

  it "has a valid factory" do
    expect(@task_specific_email_setup).to be_valid
  end
end
