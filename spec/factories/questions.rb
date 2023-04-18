FactoryBot.define do
  sequence :title do |n|
    "Title #{n}"
  end

  factory :question do
    title
    user
    body { "MyText" }

    trait :invalid do
      title { nil }
    end
  end
end
