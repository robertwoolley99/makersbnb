require 'sinatra/base'

require_relative 'model/listings.rb'
require_relative 'model/bookings.rb'

class Bnb < Sinatra::Base

  enable :sessions

  DataMapper.setup :default, "postgres://#{ENV["USER"]}@localhost/makersbnb"
  DataMapper.finalize
  DataMapper.auto_migrate!

  get '/' do
    erb :index
  end

  get '/spaces' do
    @listings = Listing.all
    @bookings = Booking.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/listed' do
    Listing.create(
      location: params[:location],
      price: params[:price_per_night],
      dates_available: params[:dates_available],
      owner_name: params[:owner_name],
      contact_details: params[:contact_details],
      description: params[:description]
    )
    redirect('/spaces')
  end

  post '/booking' do
    redirect('/confirmation')
  end

  post '/check_dates' do
    session[:listing_id] = params[:listing_id]
    redirect('/dates')
  end

  get '/dates' do
    @listings = Listing.all
    @bookings = Booking.all
    @booking = @bookings[session[:listing_id].to_i - 1]
    @listing = @listings[session[:listing_id].to_i - 1]
    erb :dates
  end

  get '/confirmation' do
    'Thanks for booking'
  end

  run! if app_file == $0
end
