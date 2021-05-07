class Payload
  include ActiveModel::Model

  attr_accessor :json_url

  def persisted?
    true
  end
end
