require 'sinatra/base'

require_relative 'model/properties.rb'

class Bnb < Sinatra::Base
  DataMapper.setup :default, "postgres://#{ENV["USER"]}@localhost/makersbnb"
  DataMapper.finalize
  DataMapper.auto_migrate!

  run! if app_file == $0
end
