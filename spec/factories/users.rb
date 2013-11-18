# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    trait :john do 
      username "john"
      email "john@apple.com"
    end
    trait :tim do 
      username "tim"
      email "tim@apple.com"
    end
    trait :phil do 
      username "phil"
      email "phil@apple.com"
    end
    password "topsecret"
  end
end
