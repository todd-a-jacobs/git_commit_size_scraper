# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_commit_size_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = "git_commit_size_scraper"
  spec.version       = GitCommitSizeScraper::VERSION
  spec.authors       = ["Todd A. Jacobs"]
  spec.email         = ["github.projects@codegnome.org"]
  spec.description   = "Walk Git history to calculate commit size in bytes."
  spec.summary       = ""
  spec.homepage      = "https://github.com/CodeGnome/git_commit_size_scraper"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "statistical_array", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
