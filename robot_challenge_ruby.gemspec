# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "robot_challenge_ruby"
  spec.version       = "0.0.1"
  spec.authors       = ["Alan Skorkin"]
  spec.email         = ["alan@skorks.com"]

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  raise "RubyGems 2.0 or newer is required to protect against public gem pushes." unless spec.respond_to?(:metadata)

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop", "~> 0.80.1"
  spec.add_development_dependency "rubocop-performance", "~> 1.5"
  spec.add_development_dependency "rubocop-rspec", "~> 1.38.1"
end
