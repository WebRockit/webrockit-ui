require 'spec_helper'

describe Check do
  it "should return an ERROR on failed API calls" do
  	bad_options = {:connection_adapter => 'break'}
  	api = Check.listTypes(bad_options)
  	expect(api).to eq("ERROR")
  end	

  it "should return a type list if API is running" do
  	#api must be running for this to work
  	# TODO: figure out a way to trick this?
  	api = JSON.parse(Check.listTypes())['check_types']
  	expect(api).to include("adhoc")
  end	
end
