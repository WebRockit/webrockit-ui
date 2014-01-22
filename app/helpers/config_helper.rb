module ConfigHelper
  def self.hash()
    if File.exists?('/opt/webrockit-ui/config/config.yml')
      configs = YAML.load_file('/opt/webrockit-ui/config/config.yml')
    else
      configs = YAML.load_file('config/config.yml')
    end
    return configs
  end
end