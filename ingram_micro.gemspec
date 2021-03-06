# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ingram_micro/version'

Gem::Specification.new do |spec|
  spec.name          = "ingram_micro"
  spec.version       = IngramMicro::VERSION
  spec.authors       = ["Ben Christel", "Khaaliq DeJan", "Rachel Heaton", "Colby Holliday", "Joseph Nguyen", "Shola Oyedele"]
  spec.email         = ["webops@walkerandcobrands.com"]

  spec.summary       = %q{Rubygem wrapper for Ingram Micro API}
  spec.homepage      = "https://github.com/WalkerAndCoBrandsInc/ingram_micro"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "require_all"
  spec.add_dependency "nori"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "fabrication"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "rubocop"
end
