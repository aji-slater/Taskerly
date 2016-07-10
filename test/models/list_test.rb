require 'test_helper'

class ListTest < ActiveSupport::TestCase

  def test_list
    List.find_or_create_by(FactoryGirl.attributes_for(:list))
  end

  test 'list factory test' do
    2.times { FactoryGirl.create(:list) }
    assert_equal 2, List.count
  end

  test 'lists have tasks' do
    list = test_list
    task = list.tasks.create!(FactoryGirl.attributes_for(:task))
    assert_includes list.tasks, task
  end

  test 'lists can add tasks' do
    list = test_list
    task = FactoryGirl.create(:task)
    list.tasks << task
    assert_includes list.tasks, task
  end

  test 'lists can have notes' do
    list = test_list
    note = list.notes.create!(FactoryGirl.attributes_for(:note))
    assert_includes list.notes, note
  end

  test 'lists can add notes' do
    list = test_list
    note = FactoryGirl.create(:note)
    list.notes << note
    assert_includes list.notes, note
  end

  test 'lists can have jots' do
    list = test_list
    jot = list.jots.create!(FactoryGirl.attributes_for(:jot))
    assert_includes list.jots, jot
  end

  test 'lists can add jots' do
    list = test_list
    jot = FactoryGirl.create(:jot)
    list.jots << jot
    assert_includes list.jots, jot
  end

  test 'lists can have comments' do
    list = test_list
    comment = list.comments.create!(FactoryGirl.attributes_for(:comment))
    assert_includes list.comments, comment
  end

  test 'lists can have stickers' do
    list = test_list
    sticker = list.stickers.create!(FactoryGirl.attributes_for(:sticker))
    assert_includes list.stickers, sticker
  end

  test 'lists can add stickers' do
    list = test_list
    sticker = FactoryGirl.create(:sticker)
    list.stickers << sticker
    assert_includes list.stickers, sticker
  end

  test 'listed items returns as expected' do
    list = FactoryGirl.create(:list)
    list.tasks.create!(FactoryGirl.attributes_for(:task))
    list.notes.create!(FactoryGirl.attributes_for(:note))
    list.jots.create!(FactoryGirl.attributes_for(:jot))
    assert_equal 3, list.listed_items.count
  end
end
