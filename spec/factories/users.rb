FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password 'password'
    sequence :email do |n|
      Faker::Internet.email + "-#{n}"
    end

    factory :user_with_orders do
      after(:create) do |user|
        create_list(:order, 3, user: user)
      end
    end
  end
end