class Graphexplorer
  def self.generateGraphurl(name,metrics,from,to,ymin,ymax)
    graphite_url = "#{ConfigHelper.hash()['graphite_url']}/render?"

    check = "#{ConfigHelper.hash()['graphite_prefix']}#{name}"

    images = []
    size = 'width=700&height=250'
    style = '&bgcolor=black&fgcolor=white&majorGridLineColor=darkgrey&minorGridLineColor=black&lineWidth=1'
    graph_size = "&yMax=#{ymax}&yMin=#{ymin}&drawNullAsZero=true"
    colors = ''

    timeframe = "&from=#{from}&until=#{to}"

    targets = []
    metrics.each do |metric|
      target = "&target=alias(keepLastValue(#{check}.#{metric}),'#{metric}')"
      targets << target
    end

    title = "&title=#{check}"
    baseurl = "#{graphite_url}#{size}#{style}#{colors}#{graph_size}#{timeframe}"
    url = "#{baseurl}#{targets.join}#{title}"

    return url
  end
end
