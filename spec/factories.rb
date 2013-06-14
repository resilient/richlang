FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Test User #{n}" }
    sequence(:email) { |n| "test_user_#{n}1@example.com" }
    password "password2013"
    password_confirmation "password2013"
  end

  factory :word do
    user
    sequence(:word) { |n| "word #{n}" }
    sequence(:translation) { |n| "translation #{n}" }
  end

end