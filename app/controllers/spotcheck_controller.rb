class SpotcheckController < ApplicationController
  def show
    @type = params['id']
    @checks = JSON.parse(Check.list({:type => @type}))['data']
    render :layout => 'base'
  end
end
