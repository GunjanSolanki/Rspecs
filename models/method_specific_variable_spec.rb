require 'rails_helper'

RSpec.describe MethodSpecificVariable, type: :model do
  before do
    @method_specific_variable = FactoryBot.build(:method_specific_variable)
  end

  it "has a valid factory" do
    expect(@method_specific_variable).to be_valid
  end
end
