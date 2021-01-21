FactoryBot.define do
  factory :task_order do
    association :task
    association :test_method
    association :procedure
    association :acceptance_criterium
    association :ref_standard
  end
end
