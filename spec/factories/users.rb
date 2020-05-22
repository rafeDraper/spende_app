FactoryBot.define do
  factory :user do
    email              { 'user@example.com' }
    password           { 'encrypted_password123' }
    role               { 0 }
  end

  factory :editor do
    email              { 'editor@example.com' }
    password           { 'encrypted_password123' }
    role               { 1 }
  end

  factory :admin do
    email              { 'admin@example.com' }
    password           { 'encrypted_password123' }
    role               { 2 }
  end
end
