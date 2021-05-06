require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    Parser.new('app/assets/payload.json')
    @payment = Payment.last
  end

  test 'payment need to have a payment_type' do
    payment2 = @payment
    payment2.id = 123644
    payment2.payment_type = nil
    assert_not payment2.valid?
  end

  test 'payment need to have number of installments' do
    payment2 = @payment
    payment2.id = 123644
    payment2.installments = nil
    assert_not payment2.valid?
  end

  test 'payment need to have value of installments' do
    payment2 = @payment
    payment2.id = 123644
    payment2.installment_amount = nil
    assert_not payment2.valid?
  end

  test 'payment need to have a valid status' do
    payment2 = @payment
    payment2.id = 123644
    payment2.status = 'paid'
    assert payment2.valid?
  end

end
