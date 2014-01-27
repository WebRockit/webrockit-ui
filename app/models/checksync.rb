class Checksync
  def self.import(type)
    if type == 'all'
      WebrockitchecksyncHelper.call("importAll")
    else 
      WebrockitchecksyncHelper.call("importByType?type=#{type}")
    end
  end

  def self.load()
    WebrockitchecksyncHelper.call("loadChecks")
  end
end
