FactoryBot.define do
  factory :report do
    material { "Test Material" }
    extent { "Test Extent" }
    results { "Test Results" }
    comments { "Test Comment" }
    super_visor { "John Doe" }
    test_site { "Test Site" }
    drawing_number { "Test Number" }
    report_number { "Test Report Number" }
    certificate_number { "Test Number" }
    inspection_of { "Test" }
    object_joint_type { "Test Joint Type" }
    welding_process { "Test Process" }
    heat_treatment { "Test Treatment" }
    order_number { "Test Order Number" }
    project_number { "Test Project Number" }
    dimension { "Test Dimension" }
    groove { "Test Groove" }
    surface_condition { "Test Condition" }
    wps { "Test WPS" }
    repairs_marked_on { "Test" }
    operator_name { "John Doe" }
    revision_number { 1 }
    test_date { Date.today }
    optional_heading_one { "Test" }
    optional_heading_two { "Test" }
    optional_heading_three { "Test" }
    optional_heading_four { "Test" }
    optional_text_one { "Test" }
    optional_text_two { "Test" }
    optional_text_three { "Test" }
    optional_text_four { "Test" }
    repairs_marked_on_object { 0 }
    repairs_marked_on_sketch { 0 }
    optional_header_title { "Test" }
    caption_one { "Test" }
    caption_two { "Test" }
    caption_three { "Test" }
  	association :client
  	association :task
    association :procedure
    association :acceptance_criterium
    association :ref_standard
    association :user
    association :test_method
    association :certificate
    association :project
  end

end
