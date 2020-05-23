FactoryBot.define do
  factory :user do
    email              { 'user@example.com' }
    password           { 'encrypted_password123' }
    role               { 0 }

    trait :admin do
      role { 'admin' }
    end
  end

  factory :admin do
    email                 { 'admin@example.com' }
    password              { 'encrypted_password123' }
    password_confirmation { 'encrypted_password123' }
    confirmed_at          { Date.today }
    role                  { 2 }

    trait :admin do
      role { 'admin' }
    end
  end
end
