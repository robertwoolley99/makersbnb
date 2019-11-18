require 'sinatra/base'

require_relative 'model/properties.rb'

class Bnb < Sinatra::Base

  DataMapper.setup :default, "postgres://#{ENV["USER"]}@localhost/makersbnb"
  DataMapper.finalize
  DataMapper.auto_migrate!
  
  get '/' do
    erb :index    
  end

  # get '/spaces' do

  run! if app_file == $0
end
