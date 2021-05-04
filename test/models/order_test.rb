require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    Parser.new('app/assets/payload.json')
    @order = Order.find(9987071)
  end

  test "order needs at least one item to be valid" do
    assert @order.items.length > 0
  end

  test "order need to have shipping" do
    assert @order.shipping
  end

  test "order need to have payments" do
    assert @order.payments.length > 0
  end

  test "order need to have items" do
    assert @order.items.length > 0
  end

  test "order need to have buyer" do
    assert @order.buyer
  end
end
