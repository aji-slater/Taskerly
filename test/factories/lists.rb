FactoryGirl.define do
  factory :list do
    user { User.first }
    sequence(:name) { |i| "list#{i}" }

    factory :commented_list do
      association :comment
    end
  end
end
