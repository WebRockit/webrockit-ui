class DisplaylistController < ApplicationController
  def show
    @type = params['id'].split(':')[0]
    @page = params['id'].split(':')[1].to_i
    @checks = Check.listWithDetails({:type => @type})
    @items_per_page = 25
    render :layout => 'base'
  end
end
