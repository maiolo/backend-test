require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  test 'store name and location must be unique' do
    store = Store.new(name:'loja teste', location: 'test address')
    store.save
    store2 = Store.new(name:'loja teste', location: 'test address')
    assert_not store2.valid?
  end
end
