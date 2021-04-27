require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = Order.new()
  end

  test "order needs at least one item to be valid" do
    assert_not @order.save
  end

  test "order needs a buyer" do
    assert_not @order.save
  end

  test "order needs to be from a store" do
    assert_not @order.save
  end
end
