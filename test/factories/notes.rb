FactoryGirl.define do
  factory :note do
    user { User.first }
    name 'note'
    text 'note text'
  end
end
