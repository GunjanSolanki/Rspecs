FactoryBot.define do
  factory :task do
    name { Faker::Name.name }
    description { "PT / PMI AKER SOLUTIONS" }
    start_date { Date.today }
    end_date { Date.tomorrow }
    order_number { "19028" }
    material_type { "Test Material" }
    drawing_number { "Test Drawing Number" }
    task_status_field { "In-progress" }
    invoice_number { "1234" }
    offshore_flag { 0 }
    client_ref { "Geir Ove Roksvåg" }
    contact_person { "Geir Ove Roksvåg" }
    contact_person_phone { "0" }
    contact_person_email { Faker::Internet.email }
    testsite { "Kristiansund" }
    information_to_operator { "<br>" }
    client_online_order { 0 }
    start_date_asap { 0 }
    thickness { "Test Thickness" }
    testextent { "Test Extent" }
    groove { "Test Groove" }
    material_quality { "Test Quality" }
    class_society { "Test Society" }
    association :client
    association :welder
    association :project
    association :operator
    association :task_manager
    association :department
    association :language
	end
end
