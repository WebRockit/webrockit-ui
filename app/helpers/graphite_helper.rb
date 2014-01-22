require 'httparty'
module GraphiteHelper
  def self.call(uri,options)
    default_options = {:headers => {"Accept" => 'application/json'}}
    options.merge!(default_options)
    begin
      response = HTTParty.get(uri, options)
      if response.code == 200
        return response.body
      else
        return "ERROR"
      end
    rescue
      return "ERROR"
    end
  end 
end