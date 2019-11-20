require 'sinatra/base'

require_relative 'model/listings.rb'
require_relative 'model/guest.rb'
require_relative 'model/landlord.rb'

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

  get '/landlord/register' do
    erb :landlord_register
  end 

  post '/landlord/registered' do
    Landlord.create(
    first_name: params[:first_name],
      last_name: params[:last_name],
      email_address: params[:email_address],
      user_name: params[:user_name],
      password: params[:password]
    )
    redirect ('/landlord/ThankYou')
  end

  get '/landlord/ThankYou' do
    "Thank you for Signing Up :)"
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
    redirect('/spaces')
  end

  run! if app_file == $0
end
