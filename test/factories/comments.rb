FactoryGirl.define do
  factory :comment do
    user { User.first }
    text 'comment.'
  end
end
