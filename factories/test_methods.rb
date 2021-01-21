FactoryBot.define do
  factory :test_method do
    name { Faker::Name.name }
    code { "Test Code" }
    description { "Test Description" }
    # default_procedure_id { 1 }
    # default_ref_standard_id { 1 }
    # default_acceptance_criterium_id { 1 }
  	association :category
  end
end
