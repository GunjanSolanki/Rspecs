FactoryBot.define do
  factory :report_signature do
    mandatory { 0 }
    association :report
    association :certificate
    association :user
  end
end
