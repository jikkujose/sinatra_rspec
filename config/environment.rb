%w|
  bundler
  active_support/deprecation
  active_support/all
|.each do |gem|
  require gem
end

Bundler.require :default
Bundler.require Sinatra::Base.environment

$db = []
