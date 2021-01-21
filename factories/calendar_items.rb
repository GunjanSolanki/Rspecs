FactoryBot.define do
  factory :calendar_item do
    title { "Test Title" }
    description { "Test Description" }
    start_date { 1.day.from_now }
    end_date { 2.days.from_now }
    association :user
    association :department
  end
end
