# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in rocket-reach.gemspec
gemspec
 
gem "rake", "~> 13.0"
gem "rspec", "~> 3.0"
gem "rubocop", "~> 1.7"
gem "rubocop-rake"
gem "rubocop-rspec"
gem "vcr", ">= 6.0.0", require: false
gem "webmock", ">= 3.10.0"

if ENV["GEM_VERSIONS"] == "min"
  gem "activesupport", "~> 4.1.0"
  gem "faraday", "~> 1.0.0"
  gem "multi_json", "~> 1.4.0"
end
