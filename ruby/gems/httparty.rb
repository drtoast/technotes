require 'httparty'

class Server
  include HTTParty
  
  base_uri "http://host.com:8080"
  
  def self.create_token(user, asset, original)
    response = self.post("/assets", :query => {:user => user, :asset => asset, :original => original})
  end
  
  def self.get_token(user, asset, token)
    response = self.get("/assets/show/#{token}.json")
  end
  
  # for testing only - this will normally be handled by the swf viewer
  def self.get_original_url(user, asset, token)
    response = get_token(user, asset, token)
    url = "#{DIGITAL_HOST}:#{DIGITAL_PORT}/assets/show/#{token}.swf"
  end
  
end