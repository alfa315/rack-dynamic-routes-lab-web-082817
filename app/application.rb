class Application

  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}

      if item != nil 
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end

# add_term = req.params["item"]
#
#       if @@items.include?(add_term)
#         @@cart << add_term
#         resp.write "added #{add_term}"
#       else
#         resp.write "We don't have that item"
#       end
