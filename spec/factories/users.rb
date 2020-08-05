FactoryBot.define do
  factory :user do
    sequence(:email) { |number| "user#{number}@spendekollektor.com" }
    password { 'encrypted_password123' }
    role     { 0 }

    trait :editor do
      role { 1 }
    end

    trait :admin do
      role { 2 }
    end

    trait :invalid_user do
      email { nil }
      password { nil }
      role { nil }
    end
  end

  factory :invalid_user, parent: :user do
    email { nil }
    password { 'encrypted_password123' }
    roles { 'de canelita' }
    role { 'admin' }
  end
end
