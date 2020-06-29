FactoryBot.define do
  factory :meetings_list do
    title       { Faker::Team.name }
    responsible { Faker::TvShows::SouthPark.character }
  end

  factory :invalid_meeting, parent: :meetings_list do
    title { nil }
  end

  factory :meetings_item do
    association :meetings_list
    date   { Date.today }
    reason { Faker::Dessert.variety }
    amount { Faker::Number.number(digits: 2) }

    trait :invalid_item do
      reason { nil }
    end
  end
end
