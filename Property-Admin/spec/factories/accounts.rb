FactoryBot.define do
  factory :account do
    ## for devise
    email { Faker::Internet.email }
    password { "passwordKu" }
    password_confirmation { "passwordKu" }
  end
end