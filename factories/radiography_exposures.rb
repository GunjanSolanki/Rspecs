FactoryBot.define do
  factory :radiography_exposure do
    material { "Test Material" }
    heat_treatment { "Test" }
    wps { "Test WPS" }
    sfd { 0 }
    exposure_mins { 0 }
    exposure_secs { 0 }
    current { "Test Current" }
    voltage { "Test Voltage" }
    version { 0 }
    no_of_films { 0 }
    req_sensitivity { "Test" }
    setup_code { "Test" }
    association :weld_process
    association :film_type
    association :iqi_type
    association :exposure_method
    association :report
  end
end
