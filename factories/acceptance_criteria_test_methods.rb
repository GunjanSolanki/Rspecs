FactoryBot.define do
  factory :acceptance_criteria_test_method do
    association :acceptance_criterium
    association :test_method
  end
end
