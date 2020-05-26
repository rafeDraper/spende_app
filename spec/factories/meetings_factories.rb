FactoryBot.define do
  factory :meetings_list do 
    title       { Faker::Team.name }
    responsible { Faker::TvShows::SouthPark.character }
  end

  factory :invalid_meeting, parent: :meetings_list do
    title { nil }
  end

  factory :meetings_item do
    meetings_list
    date   { 'Date of Today' }
    reason { 'Spende' }
    amount { 22 }
  end
end
