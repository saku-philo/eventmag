FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test1@example.com' }
    password { '123456' }
    uid { 'unique_string' }
  end
end