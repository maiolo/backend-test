class PayloadsController < ApplicationController
  
  def result
    @payload = Payload.new(payload_params)
    @parser = Parser.new(@payload.json_url)
    @result = SendData.new(@parser.parsed_order).make_request
  end
  
  def new
    @payload = Payload.new()    
  end

  def payload_params
    params.require(:payload).permit(:json_url)
  end
end
