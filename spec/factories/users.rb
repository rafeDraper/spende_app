FactoryBot.define do
  factory :user do
    id                 { nil }
    email              { 'example@example.com' }
    password           { 'encrypted_password' }
    encrypted_password { 'password' }
    created_at         { nil }
    updated_at         { nil }
    provider           { '' }
    uid                { '' }
    role               { 0 }
  end
end
