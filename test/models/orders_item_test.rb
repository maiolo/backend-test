require 'test_helper'

class OrdersItemTest < ActiveSupport::TestCase
  setup do
    Parser.new('app/assets/payload.json')
    @order_item = Order.last.orders_items[0]
  end

  test "must belongs to a order" do
    assert @order_item.order
  end

  test "must have a item" do
    assert @order_item.item
  end

  test "must have the quantity of items" do
    assert @order_item.quantity
  end

  test "must have a unit_price" do
    assert @order_item.unit_price
  end
end
