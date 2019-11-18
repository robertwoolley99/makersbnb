require 'sinatra/base'

class Bnb < Sinatra::Base

  get '/' do
    erb :index    
  end

  # get '/spaces' do

  run! if app_file == $0
end
