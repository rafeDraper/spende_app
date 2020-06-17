FactoryBot.define do
  factory :user do
    email    { 'user@spendekollektor.com' }
    password { 'encrypted_password123' }
    role     { 0 }

    trait :editor do
      role { 1 }
    end

    trait :admin do
      role { 2 }
    end
  end
end
