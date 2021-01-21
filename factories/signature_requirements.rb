FactoryBot.define do
  factory :signature_requirement do
    signature_title { "Test Title" }
    mandatory { 0 }
    include_in_report { 0 }
    association :test_method
  end
end
