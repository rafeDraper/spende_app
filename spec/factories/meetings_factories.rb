FactoryBot.define do
  factory :meetings_list do
    sequence(:title)       { |n| "Title#{n}" }
    sequence(:responsible) { |n| "Responsible#{n}" }
  end

  factory :meetings_item do
    meetings_list
    date   { 'Date of Today' }
    reason { 'Spende' }
    amount { 22 }
  end
end
