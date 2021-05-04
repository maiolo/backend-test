require 'test_helper'

class ShippingTest < ActiveSupport::TestCase
  setup do
    Parser.new('app/assets/payload.json')
    @shipping = Shipping.last
  end

  test "must have a address" do
    assert @shipping.address
  end

  test "must have a type" do
    assert @shipping.shipment_type
  end
end
