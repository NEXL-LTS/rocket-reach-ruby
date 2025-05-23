# frozen_string_literal: true

require_relative "lib/rocket_reach/version"

Gem::Specification.new do |spec|
  spec.name          = "rocket-reach"
  spec.version       = RocketReach::VERSION
  spec.authors       = ["bapu sethi", "Connor Moot"]
  spec.email         = ["bapu@nexl.io", "connor@nexl.cloud"]

  spec.summary       = "Ruby client for connecting to Rocket Reach"
  spec.description   = "Ruby client for connecting to Rocket Reach"
  spec.homepage      = "https://github.com/NEXL-LTS/rocket-reach-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activesupport", ">= 4.1.0", "< 9.0"
  spec.add_dependency "faraday", ">= 1.0.0", "< 3.0"
  spec.add_dependency "multi_json", ">= 1.4.0", "< 2.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
