FactoryBot.define do
  factory :user, aliases: [:operator, :task_manager] do
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation  { "password" }
    account_active {false}
    association :role
  end
end
