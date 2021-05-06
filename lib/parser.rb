require 'open-uri'

class Parser

  def initialize(json_path)
    @json = json_path.match?(URI.regexp) ? URI.open(json_path).string : File.read(json_path)

    if valid_json? 
      @parsed = JSON.parse(@json)
      breaking_and_saving
    else
      raise Exception.new 'Invalid Json'
    end
  end

  def parsed_order
    @order
  end

  def valid_json?
    JSON.parse(@json)
    return true
    rescue JSON::ParserError => e
    return false
  end

  private

  def breaking_and_saving
    unless Order.exists?(@parsed["id"])
      store
      phone_billing_buyer
      address_shipping
      payments
      order_items
      assotiate_payments_orders
      assotiate_shipping_orders
    else
      @order = Order.find(@parsed["id"])
    end

  end

  def store
    store = Store.new(id:@parsed['store_id'])
    store.save
  end

  def phone_billing_buyer
    phone = Phone.new(@parsed['buyer'].delete('phone'))
    billing = BillingInfo.new(@parsed['buyer'].delete('billing_info'))
    @buyer = Buyer.new(@parsed.delete('buyer'))
    @buyer.save
    @parsed['buyer'] = @buyer
    phone.buyer = @buyer
    billing.buyer = @buyer
    phone.save
    billing.save
  end

  def address_shipping
    address = @parsed['shipping'].delete('receiver_address')
    country = address.delete('country')
    city = address.delete('city')
    state = address.delete('state')
    neighborhood = address.delete('neighborhood')
    address = Address.new(address)
    address.country_id = country['id']
    address.country_name = country['name'] 
    address.state = state['name']
    address.city = city['name']
    address.neighborhood = neighborhood['name']
    address.save
    @shipping = Shipping.new(@parsed.delete('shipping'))
    @shipping.address = address
    @shipping.save
  end

  def payments
    @payments = []
    parsed_payments = @parsed.delete('payments')
    parsed_payments.each do |payment|
      payment['buyer_id'] = payment.delete('payer_id')
      pay = Payment.new(payment) 
      pay.save
      @payments << pay
    end
  end

  def order_items
    oitems = @parsed.delete('order_items')
    @order = Order.new(@parsed)
    @order.save
    oitems.each do |order_item|
      item = Item.new(order_item.delete('item'))
      item.save
      o_item = OrdersItem.new(order_item)
      o_item.order = @order
      o_item.item_id = item.id
      o_item.save
    end
  end

  def assotiate_payments_orders
    @payments.each do |payment|
      payment.order = @order
      payment.buyer = @buyer
      payment.save
    end
  end

  def assotiate_shipping_orders
    @order.shipping = @shipping
    @order.save
  end

end