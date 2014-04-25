class SpotcheckController < ApplicationController
  def show
    @type = params['id'].split(':')[0]
    @page = params['id'].split(':')[1].to_i
    @checks = JSON.parse(Check.list({:type => @type}))['data']
    @items_per_page = 25
    render :layout => 'base'
  end
end
