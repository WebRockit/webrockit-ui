class Poller
  include WebrockitapiHelper

  def self.create(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("createPoller?#{data}")
  end

  def self.list()
    return WebrockitapiHelper.call("listPollers")
  end

  def self.fetch(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("fetchPoller?#{data}")
  end

  def self.delete(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("deletePoller?#{data}")
  end
end