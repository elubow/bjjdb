FactoryBot.define do
  factory :tag do
    category          { Faker::Lorem.word }
    name              { Faker::Lorem.word }
    description       { Faker::Lorem.sentence }
  end

  trait :cat_submission do
    category { "submission" }
  end
  trait :cat_start_position do
    category { "start-position" }
  end
  trait :cat_end_position do
    category { "end-position" }
  end

end
