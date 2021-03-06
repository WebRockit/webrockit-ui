class Metric
  include MemcacheHelper

  def self.select2Fetch(name,term)
    check = "#{ConfigHelper.hash()['graphite_prefix']}#{name}"
    @metrics = {
      'results' => [],
      'more' => false,
      'url' => ''    }
    begin
      url = "#{ConfigHelper.hash()['graphite_url']}/metrics?query=#{check}.*"
      @metrics['url'] = url

      key = "metric_graphite_metrics_query_#{check}"
      val = MemcacheHelper.get(key)
      if val == 1
        list = JSON.parse(GraphiteHelper.call(url,{}))
        MemcacheHelper.set(key,list,1800)
      else
        list = val
      end

      list.each do |data|
        metric = data['text']
        if Regexp.new("#{term}") =~ metric
          metrichash = {
            'id' => metric,
            'text' => metric
          }
          @metrics['results'] << metrichash
        end
      end
        
      if @metrics['results'].length == 0
        list.each do |data|
          metrichash = {
            'id' => data['text'],
            'text' => data['text']
          }
          @metrics['results'] << metrichash
        end
      end
    rescue
      @apistatus = "ERROR"
    end
    return @metrics

  end

end
