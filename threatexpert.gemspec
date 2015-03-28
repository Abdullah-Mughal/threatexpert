# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'threatexpert/version'

Gem::Specification.new do |spec|
  spec.name          = "threatexpert"
  spec.version       = ThreatExpert::VERSION
  spec.authors       = ["chrislee35"]
  spec.email         = ["rubygems@chrislee.dhs.org"]
  spec.summary       = %q{llows for malware name and md5 hash searching of, and malware submission to ThreatExpert.com.}
  spec.description   = %q{rovides a simple API to query ThreatExpert by malware name (to receive a list of matching hashes) or hash (to receive a malware report).  This also provides a simple upload feature.}
  spec.homepage      = "http://github.com/chrislee35/threatexpert"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  spec.add_runtime_dependency "crack", "~> 0.4"
  spec.add_runtime_dependency "multipart-post", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
