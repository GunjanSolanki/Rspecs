FactoryBot.define do
  factory :film_type do
  	name {Faker::Name.name}
  	report_text {Faker::Name.name}
  end

end
