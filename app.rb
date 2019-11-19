require 'sinatra/base'

require_relative 'model/listings.rb'

class Bnb < Sinatra::Base

  DataMapper.setup :default, "postgres://#{ENV["USER"]}@localhost/makersbnb"
  DataMapper.finalize
  DataMapper.auto_migrate!

  get '/' do
    erb :index
  end

  get '/spaces' do
    @listings = Listings.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/listed' do
    Listings.create(
      location: params[:location],
      price: params[:price_per_night],
      dates_available: params[:dates_available],
      owner_name: params[:owner_name],
      contact_details: params[:contact_details],
      description: params[:description]
    )
    redirect('/confirmation')
  end

  get '/confirmation' do
    'Listing added OK'
  end

  run! if app_file == $0
end
