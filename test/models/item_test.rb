require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "no repeated item must exist" do
    item = Item.new(id:1, title: 'item teste')
    item.save
    item2 = Item.new(id:1, title: 'item teste')
    assert_not item2.valid?
  end
end
