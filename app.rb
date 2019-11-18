require 'sinatra/base'

class Bnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :new_space
  end

  run! if app_file == $0
end
