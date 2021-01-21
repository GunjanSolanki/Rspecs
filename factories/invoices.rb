FactoryBot.define do
  factory :invoice do
    association :task
  end
end
