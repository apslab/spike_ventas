class Product
  attr_reader :id, :name, :amount

  def initialize(params)
    @id = params['id']
    @name = params['name'] 
    @amount = params['amount']
  end

  def self.find(id)
    response = RestClient.get "http://localhost:3000/products/#{id}", {:accept => :json} 
    if response.code == 200
      params = ActiveSupport::JSON.decode(response.body)
      Product.new(params)
    else
      puts "ERROR: #{response.code}"
    end
  end

end
