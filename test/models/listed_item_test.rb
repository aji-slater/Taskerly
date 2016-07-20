require 'test_helper'

class ListedItemTest < ActiveSupport::TestCase
  setup do
    User.create!(email: 'test@example.com', password: 'welcome')
    @list = FactoryGirl.create(:list)
    2.times do
      @list.tasks.create!(FactoryGirl.attributes_for(:task))
      @list.notes.create!(FactoryGirl.attributes_for(:note))
      @list.jots.create!(FactoryGirl.attributes_for(:jot))
    end
  end

  test 'listed item can deliver its item name through name method' do
    it = @list.tasks.create!(name: 'Named Test', user: User.first)
    assert_equal 'Named Test', it.name
  end

  # test 'i method returns item object' do
  #   task = @list.tasks.create!(FactoryGirl.attributes_for(:task_unique_name))
  #   li = task.listings.first
  #   assert_equal li.i, task
  # end

end
