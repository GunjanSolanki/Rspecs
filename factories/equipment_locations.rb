FactoryBot.define do
  factory :equipment_location do
  	location {Faker::Address.full_address}
  end

end
