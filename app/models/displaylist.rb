class Displaylist
  def self.generateImageUrls(type,check)
    graphite_url = "#{ConfigHelper.hash()['graphite_url']}/render?"

    images = []
    size = 'width=500&height=250'
    style = '&bgcolor=black&fgcolor=white&majorGridLineColor=darkgrey&minorGridLineColor=black&lineWidth=1'
    graph_size = '&yMinLeft=0&yMinRight=0&yMax=1500&yMaxLeft=4000&drawNullAsZero=true'
    colors = '&colorList=007A7A,009191,00CCCC,00F3F3,red,blue'

    ttfb = "&target=cactiStyle(alias(alpha(stacked(keepLastValue(#{check}.timetofirstbyte)),0.5),%22Time%20To%20First%20Byte%20(ms)%22))&target=alias(alpha(lineWidth(keepLastValue(#{check}.timetofirstbyte),2),0.9),%22%22)"
    total_time = "&target=cactiStyle(alias(alpha(stacked(keepLastValue(diffSeries(#{check}.httptrafficcompleted,#{check}.timetofirstbyte))),0.5),%22Full%20Page%20Load%20(ms)%22))&target=alias(alpha(lineWidth(keepLastValue(#{check}.httptrafficcompleted),2),0.8),%22%22)"
    content_length = "&target=alias(alpha(secondYAxis(lineWidth(keepLastValue(#{check}.contentlength),1)),0.5),%22Content%20Length%20(bytes)%22)"

    image_urls = {
      '1 Day' => '&from=-1day&until=-30min',
      '2 Day' => '&from=-2day&until=-30min',
      '1 Week' => '&from=-7day&until=-30min',
      '1 Month' => '&from=-30day&until=-30min'
    }
    image_urls.each do |name,timeframe|
      title = "&title=#{name} - #{check}"
      baseurl = "#{graphite_url}#{size}#{style}#{colors}#{graph_size}#{timeframe}"
      url = "#{baseurl}#{ttfb}#{total_time}#{content_length}#{title}"
      images << url
    end
    return images
  end
end
