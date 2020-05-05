FactoryBot.define do
  factory :meetings_item do
    meetings_list_id { 2 }
    date { '2020-19-04' }
    reason '{spende}'
    amount { 20 }
    created_at { '2020-05-04 14:20:53' }
    updated_at { '2020-05-04 15:20:53' }
    completed_at { '2020-05-11 14:20:53' }
    amount_cents { 21 }
    amount_currency { 'EUR' }
  end
end
