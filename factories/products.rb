FactoryBot.define do
  factory :product do
    quantity { 0.00 }
    size_type { "Test Size Type" }
    price { 0.00 }
    description { "Test Description" }
    association :task
    association :product, factory: :consumable_product
  end
end
