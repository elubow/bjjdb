FactoryBot.define do
  factory :link do
    title       { Faker::Company.bs }
    description { Faker::Lorem.words(50) }
    url         { Faker::Internet.url }
    user

    trait :from_youtube do
      url         { Faker::Internet.url('youtube.com') }
      location    { 'youtube.com' }
    end

    trait :from_instagram do
      url         { Faker::Internet.url('instagram.com') }
      location    { 'instagram.com' }
    end

    factory :instagram_link, traits: [:from_instagram]
    factory :youtube_link, traits: [:from_youtube]

    factory :with_tags do
      transient do
        tags_count { 7 }
      end

      after(:create) do |link, evaluator|
        create_list(:tag, evaluator.tag_count, links: [link])
      end
    end

    factory :with_instructors do
      transient do
        instructors_count { 1 }
      end

      after(:create) do |link, evaluator|
        create_list(:instructor, evaluator.instructor_count, instructors: [instructor])
      end
    end
  end
end
