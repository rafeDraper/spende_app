FactoryBot.define do
  factory :user do
    email              { 'user@example.com' }
    password           { 'encrypted_password123' }
    role               { 0 }
  end

  factory :editor do
    id                 { nil }
    email              { 'editor@example.com' }
    password           { 'encrypted_password' }
    encrypted_password { 'password' }
    created_at         { nil }
    updated_at         { nil }
    provider           { '' }
    uid                { '' }
    role               { 1 }
  end

  factory :admin do
    id                 { nil }
    email              { 'admin@example.com' }
    password           { 'encrypted_password' }
    encrypted_password { 'password' }
    created_at         { nil }
    updated_at         { nil }
    provider           { '' }
    uid                { '' }
    role               { 2 }
  end
end
