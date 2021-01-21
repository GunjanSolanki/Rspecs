FactoryBot.define do
  factory :generated_report do
    report_number { "Test Number" }
    method_type { "Test Method Type" }
    inspection_of { "Test Inspection of" }
    result { "Test Result" }
    test_date { 1.day.from_now }
    last_rev_date { 2.days.ago }
    association :task
    association :report
    association :client
    association :project
  end
end
