FactoryBot.define do
  factory :department do
  	name {Faker::Name.name}
  	association :user
  end
end
