webrockit-ui
============

User interface for the Webrockit performance measurement system. This is a rails 4.0 application. 

**Setup**

 * Add your configuration parameters to config/application.rb.example
 * Copy config/application.rb.example to config/application.rb

**Build**

 * Install java, openjdk 1.7 tested
 * Install jruby
 * Install bundler
 * Run bundle install
 * Run warble

**Running:**

1. Copy "config/config.yml.example" to "config/config.yml" and edit settings.
2. Config is also fetched out of "/opt/webrockit-api/config/config.yml"
`run java -Djetty.port=8082 -jar webrockit-ui.war`

**Deploy**

 * Deploy the generated war file to your favorite servlet
 * ext/install.sh will install this application on centos 6

### License
   webrockit-ui is released under the MIT license, and bundles other liberally licensed OSS components [License](LICENSE.txt)  
   [Third Party Software](third-party.txt)
