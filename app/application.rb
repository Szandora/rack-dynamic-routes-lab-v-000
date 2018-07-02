class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_search = req.path.split("/items/").last
      item = @@items.find{|i| i.item == item_search}

      resp.write item
    end
    resp.finish
  end
end
      
