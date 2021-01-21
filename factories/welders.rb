FactoryBot.define do
  factory :welder do
  	first_name {Faker::Name.first_name}
  	last_name {Faker::Name.last_name}
  	client {FactoryBot.create(:client)}
  end

end
