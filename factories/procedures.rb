FactoryBot.define do
  factory :procedure do
    name {Faker::Name.name}
    document_number { "Test Document Number" }
    description { "Test Description" }
  end
end
