require 'httparty'
module WebrockitchecksyncHelper
	def self.call(call)
		csurl = ConfigHelper.hash()['webrockitchecksync_url']
		version = ConfigHelper.hash()['webrockitchecksync_version']
		uri = "#{csurl}/#{version}/#{call}"
		options = {
			:headers => {"Accept" => 'application/json'},
			:basic_auth => {
				:username => ConfigHelper.hash()['webrockitchecksync_user'], 
				:password => ConfigHelper.hash()['webrockitchecksync_pass']
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