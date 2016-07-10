FactoryGirl.define do
  factory :jot do
    user { User.first }
    text 'jotted'
  end
end
