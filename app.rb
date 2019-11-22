require 'sinatra/base'

require_relative 'model/listings.rb'
require_relative 'model/bookings.rb'
require_relative 'model/guest.rb'
require_relative 'model/landlord.rb'
require_relative 'lib/get_dates.rb'


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
    @listings[0] == nil ? erb(:no_listings) : erb(:spaces)
  end

  get '/spaces/new' do
    erb :new_space
  end

  get '/guest/register' do
    erb :guests_register
  end

  post '/guest/registered' do
    Guest.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_address: params[:email_address],
      user_name: params[:user_name],
      password: params[:password]
    )
    redirect('/guest/ThankYou')
  end

  get '/guest/ThankYou' do
    "Thank you for Signing Up :)"
  end

  get "/landlord/home" do
     erb :landlord_home
  end

  get '/landlord/login' do
    erb :landlord_login
  end

  post '/landlord/secure_login' do
        # look up username & password in database
    current_landlord = Landlord.first(:user_name => params[:user_name], :password => params[:password])
    if current_landlord == nil 
      redirect ('/landlord/error')
    else
        # save id to session
      session[:landlord_id] = current_landlord.id
      redirect ('/landlord/welcome')
    end 
  end

  get "/landlord/error" do
    erb :landlord_error 
  end 

  get '/landlord/register' do
    erb :landlord_register
  end

  post '/landlord/registered' do
    current_landlord = Landlord.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_address: params[:email_address],
      user_name: params[:user_name],
      password: params[:password]
    )
    session[:landlord_id] = current_landlord.id
    redirect ('/landlord/welcome')
  end

  get '/landlord/welcome' do
    @landlord_id = session[:landlord_id] # temporary to test
    erb :landlord_welcome
  end

  get '/landlord/view' do
    @landlord = Landlord.get(session[:landlord_id]) # shows you your own account
    erb :landlord_view
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
    Booking.create(
      check_in: params[:check_in],
      check_out: params[:check_out],
      listing_id: params[:listing_id]
    )
    redirect('/confirmation')
  end

  post '/check_dates' do
    session[:listing_id] = params[:listing_id]
    redirect('/dates')
  end

  get '/dates' do
    @listing = Listing.all(:id => session[:listing_id])[0]
    @bookings = Booking.all(:listing_id => @listing.id)
    get_dates
    erb :dates
  end

  get '/confirmation' do
    'Thanks for booking'
  end

  run! if app_file == $0
end
