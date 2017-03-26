require 'simplecov'
require 'coveralls'

formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter::new(formatters)

SimpleCov.start do
  add_filter { |src| !(src.filename =~ /lib/) }
  add_filter "spec.rb"
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'gemaker'
