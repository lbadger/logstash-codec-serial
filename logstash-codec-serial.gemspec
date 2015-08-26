Gem::Specification.new do |s|

  s.name            = 'logstash-codec-serial'
  s.version         = '1.0.1'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "This codec may be used to decode (via inputs) and encode (via outputs) full SERIAL messages"
  s.description     = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Lance Badger"]
  s.email           = 'lance.badger@gmail.com'
  s.homepage        = "https://xennsoft.com"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "codec" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", '>= 1.4.0', '< 2.0.0'

  s.add_development_dependency 'logstash-devutils'
end
