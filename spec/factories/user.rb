FactoryBot.define do
  factory :user do
    email       { Faker::Internet.unique.email }
    name        { Faker::Name.name }
    password    { 'test123' }
  end

  trait :is_admin do
    role        { 'admin' }
  end

  trait :is_user do
    role        { 'user' }
  end
end
