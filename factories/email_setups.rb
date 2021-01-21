FactoryBot.define do
  factory :email_setup do
  	title {Faker::Name.name}
  	from_email {Faker::Internet.email}
  	subject {Faker::Name.name}
  	sender_name {Faker::Name.name}
  end

end
