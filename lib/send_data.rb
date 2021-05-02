require 'net/http'
require 'uri'
require 'json'
require 'date'

class SendData
  def initialize(order)
    @order = order

    make_request
  end

  def make_request
    items
    payments
    
    date = DateTime.now

    uri = URI.parse("https://delivery-center-recruitment-ap.herokuapp.com/")

    header = {'Content-Type': 'text/json', 'X-Sent': "#{date.hour}h#{date.minute} - #{date.strftime('%d/%m/%y')}"} 
    body = {
        "externalCode": @order.id.to_s,
        "storeId": @order.store_id,
        "subTotal": sprintf("%.2f", @order.total_amount),
        "deliveryFee": sprintf("%.2f", @order.total_shipping),
        "total_shipping": @order.total_shipping,
        "total": sprintf("%.2f", @order.paid_amount),
        "country": @order.shipping.address.country_id,
        "state": @order.shipping.address.state,
        "city": @order.shipping.address.city,
        "district": @order.shipping.address.neighborhood,
        "street": @order.shipping.address.street_name,
        "complement": @order.shipping.address.comment,
        "latitude": @order.shipping.address.latitude.to_f,
        "longitude":  @order.shipping.address.longitude.to_f,
        "dtOrderCreate": @order.date_created,
        "postalCode": @order.shipping.address.zip_code,
        "number": @order.shipping.address.street_number.to_s,
        "customer": {
            "externalCode": @order.buyer.id.to_s,
            "name": @order.buyer.nickname,
            "email": @order.buyer.email,
            "contact": @order.shipping.address.receiver_phone.to_s
        },
        "items": @items,
        "payments": @payments
    }

    request = Net::HTTP.post(uri, body.to_json, header)
  end

  def items
    @items = []
    @order.items.each_with_index do |item,index|
      @items << {
        "externalCode": item.id,
        "name": item.title,
        "price": @order.orders_items[index].unit_price,
        "quantity": @order.orders_items[index].quantity,
        "total": @order.orders_items[index].full_unit_price,
        "subItems": []
      }
    end
  end

  def payments
    @payments = []
    @order.payments.each do |payment|
      @payments <<  {
        "type": payment.payment_type.upcase,
        "value": payment.total_paid_amount
      }
    end
  end

end