require 'sinatra/base'

class Bnb < Sinatra::Base
  run! if app_file == $0
end
