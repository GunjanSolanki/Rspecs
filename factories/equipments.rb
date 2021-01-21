FactoryBot.define do
  factory :equipment do
  	name { Faker::Name.name }
  	association :equipment_type
  	association :department
  	association :supplier
    association :equipment_location
    association :user
  end

end
