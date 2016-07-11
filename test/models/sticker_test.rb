require 'test_helper'

class StickerTest < ActiveSupport::TestCase
  test 'a sticker can be on a list' do
    list = FactoryGirl.create(:list)
    sticker = FactoryGirl.create(:sticker)
    list.stickers << sticker
    assert_includes sticker.lists, list
    assert_includes list.stickers, sticker
  end

  test 'a sticker can be on many lists' do
    sticker = FactoryGirl.create(:sticker)
    list = FactoryGirl.create(:list)
    list.stickers << sticker
    list1 = FactoryGirl.create(:list)
    list1.stickers << sticker
    assert_includes sticker.lists, list
    assert_includes sticker.lists, list1
  end
end
