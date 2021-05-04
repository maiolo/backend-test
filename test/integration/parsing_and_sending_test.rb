require 'test_helper'

class ParsingAndSendingTest < ActionDispatch::IntegrationTest
  test "Order must parsed correctly and saved" do
    Parser.new('app/assets/payload.json')
    assert Order.exists?(9987071)
  end

  test "server must return 200 OK" do
    Parser.new('app/assets/payload.json')
    order = Order.find(9987071)
    assert SendData.new(order).make_request.body == "OK"
  end

end
