require 'httparty'
module WebrockitapiHelper
	def self.call(call)
		wrurl = ConfigHelper.hash()['webrockitapi_url']
		version = ConfigHelper.hash()['webrockitapi_version']
		uri = "#{wrurl}/#{version}/#{call}"
		options = {
			:headers => {"Accept" => 'application/json'},
			:basic_auth => {
				:username => ConfigHelper.hash()['webrockitapi_user'], 
				:password => ConfigHelper.hash()['webrockitapi_pass']
			}
		}
		begin
	    response = HTTParty.get(uri, options)
	    if response.code == 200
	    	return response.body
	    else
	    	return "ERROR"
	    end
	  rescue => e
	  	return "ERROR"
	  end
	end	

  def self.params2string(params)
    opts = []
    params.each{ |k,v| opts << "#{k}=#{v}&" }
    return URI::encode(opts.join)
  end
end