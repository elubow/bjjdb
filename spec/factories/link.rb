FactoryBot.define do
  factory :link do
    title       { Faker::Company.bs }
    description { Faker::Lorem.words(50) }
    user
  end

  trait :from_youtube do
    url         { Faker::Internet.url('youtube.com') }
    location    { 'YouTube' }
  end

  trait :from_instagram do
    url         { Faker::Internet.url('instagram.com') }
    location    { 'Instagram' }
  end
end
