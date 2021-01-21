FactoryBot.define do
  factory :consumable_product do
    name {Faker::Name.name}
    default_description { "Test Description" }
    size_type { "Test Size Type" }
    product_number { 0 }
    default_price { 0.00 }
  end

end
