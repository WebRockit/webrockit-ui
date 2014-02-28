require 'dalli'
module MemcacheHelper
  def self.set(key,value,expire)
    begin
        md5 = Digest::MD5.digest(key)
        mem = Dalli::Client.new("#{ConfigHelper.hash()['memcached_host']}:#{ConfigHelper.hash()['memcached_port']}", :threadsafe => true, :expires_in => expire)
        str = Marshal.dump(value)
        obj = mem.set(md5, str)
        Rails.logger.debug "[MEM][SET] set #{key}"
    rescue Exception => msg
        Rails.logger.debug "[MEM][SET] set fail #{key} - #{msg}"
        return 1
    end
  end
  def self.get(key)
    begin
        md5 = Digest::MD5.digest(key)
        mem = Dalli::Client.new("#{ConfigHelper.hash()['memcached_host']}:#{ConfigHelper.hash()['memcached_port']}", :threadsafe => true)
        value = mem.get(md5)
        obj = Marshal.load(value)
        Rails.logger.debug "[MEM][GET] cache hit for #{key}"
        return obj
    rescue
        Rails.logger.debug "[MEM][GET] cache miss for #{key}"
        return 1
    end
  end
  def self.purge()
  end 
end