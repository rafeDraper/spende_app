FactoryBot.define do
  factory :meetings_list do
    title       { 'Test Name' }
    responsible { 'Test Responsible' }
  end

  factory :meetings_item do
    meetings_list
    date   { 'Date of Today' }
    reason { 'Spende' }
    amount { 22 }
  end
end
