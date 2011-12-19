module RestResource
  
  def post(params)
    invoke(:post, params)
  end

  def put(params)
    invoke(:put, params)
  end

  def get(params)
    invoke(:get, params)
  end

  def delete(params)
    invoke(:delete, params)
  end
  
  def invoke(action, params)
    response = RestClient.send(action, url, params, :accept => :json) 
    to_hash(response.body)
  end

  def to_hash(body)
    ActiveSupport::JSON.decode(body)
  end

  def url
    "#{base_path}/#{resource}"
  end

  def base_path
    'http://127.0.0.1:3000'
  end
 
  def resource
    self.class.to_s.tableize
  end
end
