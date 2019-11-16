class Application
 
  @@items = ["apples","Carrots","Pears"]

  @@cart = ["Soap", "Shampoo", "Face Cleanser"]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/cart/)
      @@cart.each do |cart|
        resp.write "#{cart}\n"
      end
    elsif req.path.match(/add/)
 
      search_term = req.params["q"]
 
      if @@items.include?(search_term)
        @@cart << search_term
        resp.write "#{search_term} added to cart"
      else
        resp.write "Couldn't find #{search_term}"
      end
 
    else
      resp.write "Path Not Found"
    end
 
    resp.finish
  end
end
