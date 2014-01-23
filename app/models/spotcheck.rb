class Spotcheck
  def self.generateImageUrl(type,check)
    graphite_url = "#{ConfigHelper.hash()['graphite_url']}/render?"

    images = []
    size = 'width=1100&height=150'
    style = '&bgcolor=black&fgcolor=white&majorGridLineColor=darkgrey&minorGridLineColor=black&lineWidth=1'
    graph_size = '&yMinLeft=0&yMinRight=0&yMax=1500&yMaxLeft=4000&drawNullAsZero=true'
    colors = '&colorList=007A7A,009191,00CCCC,00F3F3,red,blue'

    total_time = "&target=alias(#{check}.httptrafficcompleted,%22Full%20Page%20Load%20(ms)%22)"
    timeframe = '&from=-2day&until=-30min'

    title = "&title=#{name} - #{check}"
    baseurl = "#{graphite_url}#{size}#{style}#{colors}#{graph_size}#{timeframe}"
    url = "#{baseurl}#{total_time}#{title}"
    
    return url
  end
end
