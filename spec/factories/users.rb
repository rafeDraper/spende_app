FactoryBot.define do
  factory :user do
    email              { 'user@example.com' }
    password           { 'encrypted_password123' }
    role               { 0 }

    trait :admin do
      role             { 'admin' }
    end
  end

  factory :editor do
    email              { 'editor@example.com' }
    password           { 'encrypted_password123' }
    role               { 1 }
  end

  # factory :admin do
  #  email              { 'admin@example.com' }
  #  password           { 'encrypted_password123' }
  #  role               { 2 }
  # end
end
