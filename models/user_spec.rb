require 'rails_helper'

RSpec.describe User, type: :model do
  before do |test_case|
    unless test_case.metadata[:skip_before]
      @role = FactoryBot.create(:role, name: 'client')
      @user = FactoryBot.build(:user)
    end
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a first name, last name, email, password and role" do
    expect(@user).to be_valid
  end

  it "is invalid without a first name" do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = FactoryBot.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without a role", skip_before: true do
    user = FactoryBot.build(:user, role: nil)
    user.valid?
    expect(user.errors[:role]).to include("must exist")
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "john@example.com", role: @role)
    user = FactoryBot.build(:user, email: "john@example.com")

    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it "returns a user's full name as a string" do
    user = FactoryBot.build(:user,
      first_name: "Jon",
      last_name: "Snow",
      email: "jonsnow@example.com"
    )
    expect(user.full_name).to eq "Jon Snow"
  end

  it "is not active" do
    user = FactoryBot.build(:user)
    expect(user.account_active).to eq false
  end

  it "is active" do
    user = FactoryBot.build(:user, account_active: true)
    expect(user.account_active).to eq true
  end
end
