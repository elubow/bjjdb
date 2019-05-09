FactoryBot.define do
  factory :private_note do
    title     { Faker::Lorem.words(5) }
    body      { Faker::Lorem.words(50) }
    user
    link
  end

  trait :long_note do
    body      { Faker::Lorem.words(500) }
  end
end
