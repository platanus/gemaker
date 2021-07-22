lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemaker/version'

Gem::Specification.new do |spec|
  spec.name          = "gemaker"
  spec.version       = Gemaker::VERSION
  spec.authors       = ["Leandro Segovia"]
  spec.email         = ["ldlsegovia@gmail.com"]

  spec.summary       = "Gem to build gems"
  spec.description   = "Ruby CLI created to build Platanus' gems"
  spec.homepage      = "https://github.com/platanus/gemaker"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "artii", "~> 2.1", ">= 2.1.1"
  spec.add_dependency "colorize", "~> 0.7", ">= 0.7.7"
  spec.add_dependency "commander"
  spec.add_dependency "power-types"

  spec.add_development_dependency "bundler", "~> 2.2.15"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "rubocop", "~> 1.9"
end
