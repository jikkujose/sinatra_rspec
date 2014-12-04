require './config/environment'

run Rack::URLMap.map '/' => TodoAPI
