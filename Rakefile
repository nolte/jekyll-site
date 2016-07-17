# encoding: utf-8
# coding: utf-8

require 'colorize'
require 'html-proofer'
require 'jekyll'
require 'rubocop/rake_task'
require 'uri'
# config.encoding = "utf-8"

Encoding.default_external = Encoding::UTF_8

Encoding.default_internal = Encoding::UTF_8

# Do not touch below this line
RuboCop::RakeTask.new

# Extend string to allow for bold text.
class String
  def bold
    "\033[1m#{self}\033[0m"
  end
end

# Rake Jekyll tasks
task :build do
  puts 'Building site...'.yellow.bold
  Jekyll::Commands::Build.process(profile: true)
end

task :clean do
  puts 'Cleaning up _site...'.yellow.bold
  Jekyll::Commands::Clean.process({})
end

task :html_proofer do
  Rake::Task['build'].invoke
  # host_regex = Regexp.new(site_domain(config_file))
  puts 'Running html proofer...'.yellow.bold
  url_swap = { '/jekyll-site/' => '/' }
  opts = { log_level: ':debug',
           url_ignore: ['asciiflow.com'],
           url_swap: url_swap }
  HTMLProofer.check_directory('./_site', opts).run
end
