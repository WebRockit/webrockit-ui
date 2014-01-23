class MetricsController < ApplicationController
  def show
    check = params['id'].gsub('__','.')
    term = params['q']
    metrics = Metric.select2Fetch(check,term)

    render json: metrics
  end
end
