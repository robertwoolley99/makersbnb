require 'sinatra/base'

class Bnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/listed' do
    # add to database
    redirect('/confirmation')
  end

  get '/confirmation' do
    'Listing added OK'
  end

  run! if app_file == $0
end
