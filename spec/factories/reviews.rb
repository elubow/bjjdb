FactoryBot.define do
  factory :review do
    stars { 1 }
    description { "MyText" }
    user { nil }
    gym { nil }
  end
end
