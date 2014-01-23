class Type
  include WebrockitapiHelper

  def self.create(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("createType?#{data}")
  end

  def self.list()
    return WebrockitapiHelper.call("listTypes")
  end

  def self.fetch(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("fetchType?#{data}")
  end

  def self.delete(params)
    data = WebrockitapiHelper.params2string(params)
    return WebrockitapiHelper.call("deleteType?#{data}")
  end
end