FactoryGirl.define do
  factory :sticker do
    user { User.first }
    name 'sticker'
    color 'red'
    shape 'round'
  end
end
