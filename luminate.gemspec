# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'luminate/version'

Gem::Specification.new do |spec|
  spec.name          = "luminate"
  spec.version       = Luminate::VERSION
  spec.authors       = ["Spike Ilacqua"]
  spec.email         = ["spike@indra.com"]
  spec.summary       = %q{Ruby Gem for accessing the Convio's Luminate Online Server APIs}
  spec.description   = %q{Access the Convio's Luminate Online Server APIs http://open.convio.com/api}
  spec.homepage      = "https://github.com/spike/luminate"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'multi_json'
  spec.add_runtime_dependency 'map'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
