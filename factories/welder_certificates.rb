FactoryBot.define do
  factory :welder_certificate do
  	welder {FactoryBot.create(:welder)}
  	standard {Faker::Name.name}
  	welder_certification_standard {FactoryBot.create(:welder_certification_standard, name: standard)}
  end

end
