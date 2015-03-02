# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'safe_attribute_assignment/version'

Gem::Specification.new do |spec|
  spec.name = 'safe_attribute_assignment'
  spec.version = SafeAttributeAssignment::VERSION
  spec.authors = ['Bidu Developers']
  spec.email = ['dev@bidu.com.br']
  spec.summary = 'Attribute Assignment that does not crash when attribute does not exist'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'simplecov'
end
