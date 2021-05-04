require 'test_helper'

class BuyerTest < ActiveSupport::TestCase
  test "Need to have a fist_name and last_name" do
    buyer = Buyer.new(nickname: 'teste', email: 'teste@teste.com')
    assert_not buyer.save
  end

  test "nickname must be unique" do
    buyer1 = Buyer.new(nickname: 'teste', email: 'teste@teste.com', first_name: 'teste', last_name: 'teste')
    buyer1.save
    buyer2 = Buyer.new(nickname: 'teste', email: 'teste2@teste.com', first_name: 'teste2', last_name: 'teste2')
    assert_not buyer2.valid?
  end

  test "email must be unique" do
    buyer1 = Buyer.new(nickname: 'teste', email: 'teste@teste.com', first_name: 'teste', last_name: 'teste')
    buyer1.save
    buyer2 = Buyer.new(nickname: 'teste2', email: 'teste@teste.com', first_name: 'teste2', last_name: 'teste2')
    assert_not buyer2.valid?
  end
end
