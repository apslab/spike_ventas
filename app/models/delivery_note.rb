class DeliveryNote
  include RestResource

  def delivery(customer, product, amount)
    response = post :delivery_note => {:customer_id => customer.id, :product_id => product.id, :amount => amount }
    response['id']
  end
end
