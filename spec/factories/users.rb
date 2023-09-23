# In spec/factories/users.rb

FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
    name { 'Example User' }
    role { 'User' }
  end
end
