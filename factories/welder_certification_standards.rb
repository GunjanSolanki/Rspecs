FactoryBot.define do
  factory :welder_certification_standard do
  	name {Faker::Name.last_name}
  	form_type {"form_type 1"}
  end

end
