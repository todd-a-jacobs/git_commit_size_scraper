#!/usr/bin/env ruby

require 'pp'
require 'bundler/setup'
require 'statistical_array'
require 'git_commit_size_scraper/version'
require 'git_commit_size_scraper/scraper'

if __FILE__ == $0
  load File.join(__dir__, '..', 'bin', 'git_commit_size_scraper')
end
