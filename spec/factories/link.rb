FactoryBot.define do
  factory :link do
    title       { Faker::Company.bs }
    description { Faker::Lorem.words(50) }
    url         { Faker::Internet.url }
    user

    trait :from_youtube do
      url         { Faker::Internet.url('youtube.com') }
      location    { 'YouTube' }
    end

    trait :from_instagram do
      url         { Faker::Internet.url('instagram.com') }
      location    { 'Instagram' }
    end

    factory :instagram_link, traits: [:from_instagram]
    factory :youtube_link, traits: [:from_youtube]
  end
end
