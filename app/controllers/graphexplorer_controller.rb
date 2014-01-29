class GraphexplorerController < ApplicationController
  def show
    @type = params['id']
    @checks = JSON.parse(Check.list({:type => @type}))['data']
    @params = params

    #set our default timeframes
    @to = 30.seconds.ago.strftime("%F %H:%M")
    @from = 1.days.ago.strftime("%F %H:%M")

    #re-set some vars back if this was a submitted form
    #make sure these are #'s and timestamps
    if params["form"] == "true"
      @ymin = params["ymin"].to_i
      @ymax = params["ymax"].to_i
      @to = params["to"] ? Time.parse(params["to"]).strftime("%F %H:%M") : @to
      @from = params["from"] ? Time.parse(params["from"]).strftime("%F %H:%M") : @from
      @checkstr = params["checks"]
      @metricstr = params["metrics"]
    end
    
    render :layout => 'base'
  end
end
