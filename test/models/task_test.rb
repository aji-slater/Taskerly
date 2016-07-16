require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'tasks without users can\'t exist' do
    task = Task.create(name: 'failing task')
    assert_equal nil, task.id
  end

  test 'default state is false' do
    task = FactoryGirl.create(:task)
    assert_equal false, task.state
  end

  test 'a task can be on a list' do
    task = FactoryGirl.create(:task)
    list = FactoryGirl.create(:list)
    list.tasks << task
    assert_includes task.lists, list
  end

  test 'a task can be on many lists' do
    task = FactoryGirl.create(:task)
    list = FactoryGirl.create(:list)
    list.tasks << task
    list1 = FactoryGirl.create(:list)
    list1.tasks << task
    assert_includes task.lists, list
    assert_includes task.lists, list1
  end

  test 'task is added at correct position' do
    list = FactoryGirl.create(:list)
    3.times { list.tasks.create(FactoryGirl.attributes_for(:task)) }
    task = list.tasks.create!(FactoryGirl.attributes_for(:task))
    assert_equal 4, task.position_on(list)
  end

  test 'task can be at two different positions on different lists' do
    task = FactoryGirl.create(:task)
    list = FactoryGirl.create(:list)
    list.tasks << task
    list1 = FactoryGirl.create(:list)
    2.times { list1.tasks.create!(FactoryGirl.attributes_for(:task)) }
    list1.tasks << task
    assert_equal 1, task.position_on(list)
    assert_equal 3, task.position_on(list1)
  end

  test 'tasks can have comments' do
    task = FactoryGirl.create(:task)
    comment = task.comments.create!(FactoryGirl.attributes_for(:comment))
    assert_includes task.comments, comment
  end

  test 'tasks can have stickers' do
    task = FactoryGirl.create(:task)
    sticker = task.stickers.create!(FactoryGirl.attributes_for(:sticker))
    assert_includes task.stickers, sticker
  end

  test 'tasks can add stickers' do
    task = FactoryGirl.create(:task)
    sticker = FactoryGirl.create(:sticker)
    task.stickers << sticker
    assert_includes task.stickers, sticker
  end
end
