require 'date'

FactoryGirl.define do
  factory :task do
    user { User.first }
    name 'task'

    factory :task_unique_name do
      id 555
      name 'More Unique'
    end

    # factory :dated_task do
    #   due_date { Date.new(2020, 12, 31) }
    # end
    #
    # factory :past_task do
    #   due_date { Date.new(2001, 12, 31) }
    # end
  end
end
