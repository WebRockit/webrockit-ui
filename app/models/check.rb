class Check
  include WebrockitapiHelper
  include GraphiteHelper
  include MemcacheHelper

  def self.create(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("createCheck?#{data}")
  end

  def self.list(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("listChecks?#{data}")
  end

  def self.listWithDetails(params)
    key = "check_listWithDetails_#{params}"
    val = MemcacheHelper.get(key)
    if val == 1
      data = WebrockitapiHelper.params2string(params)
      checks = JSON.parse(WebrockitapiHelper.call("listChecks?#{data}"))['data']
      fullobj = {}

      checks.each do |fcheck|
        check = fcheck.split('::')[1]
        req = WebrockitapiHelper.params2string({:name => check}.merge(params))
        details = JSON.parse(WebrockitapiHelper.call("fetchCheck?#{req}"))['data']
        fullobj[check] = details
      end
      MemcacheHelper.set(key,fullobj,3600)
      return fullobj
    else
      return val
    end
  end

  def self.fetch(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("fetchCheck?#{data}")
  end

  def self.delete(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("deleteCheck?#{data}")
  end

  def self.select2Fetch(type,term)
    @checks = {
      'results' => [],
      'more' => false
    }
    begin
      checks = JSON.parse(Check.list({:type => type}))['data']
      checks.each do |check|
        if Regexp.new("#{term}") =~ check
          checkhash = {
            'id' => check.split('::')[1],
            'text' => check.split('::')[1]
          }
          @checks['results'] << checkhash
        end
      end
      if @checks['results'].length == 0
        checks.each do |check|
          checkhash = {
            'id' => check.split('::')[1],
            'text' => check.split('::')[1]
          }
          @checks['results'] << checkhash
        end
      end
    rescue
      #failed
    end

    return @checks
  end
end
