require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  it "has a valid factory" do
    expect(@task).to be_valid
  end
end
