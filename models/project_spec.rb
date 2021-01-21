require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @project = FactoryBot.build(:project)
  end

  it "has a valid factory" do
    expect(@project).to be_valid
  end

  it "is invalid without a name" do
    project = FactoryBot.build(:project, name: nil)
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")
  end
end
