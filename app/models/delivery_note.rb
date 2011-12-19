class DeliveryNote
  def delivery(customer, product, amount)
    params = {:delivery_note => {:customer_id => customer.id, :product_id => product.id, :amount => amount }}
    response = RestClient.post "http://127.0.0.1:3000/delivery_notes", params, :accept => :json
    ActiveSupport::JSON.decode(response.body)['id']
  end
end
