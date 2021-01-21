FactoryBot.define do
  factory :project do
    name {Faker::Name.name}
    description {""}
    location {"Kristiansund"}
    client_project_number {""}
    comments {nil}
    manager_name {"Asgeir Møst"}
    manager_phone {97721679}
    manager_email {"post@ki-as.no"}
    status {"in_progress"}
    association :user
    association :client
  end

end
