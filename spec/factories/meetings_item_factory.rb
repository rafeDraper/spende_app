FactoryBot.define do
  factory :meetings_item do
    id     { 2 }
    date   { 'Date of Today' }
    reason { 'Spende' }
    amount { 22 }
    meetings_list_id { 2 }
  end
end
