FactoryBot.define do
  factory :instructor do
    name        { Faker::Name.unique.name }
  end
end
