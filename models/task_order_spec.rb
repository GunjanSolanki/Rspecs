require 'rails_helper'

RSpec.describe TaskOrder, type: :model do
  before do
    @task_order = FactoryBot.build(:task_order)
  end

  it "has a valid factory" do
    expect(@task_order).to be_valid
  end
end
