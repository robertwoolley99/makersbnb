require "data_mapper"
require "dm-postgres-adapter"

class Landlord
  include DataMapper::Resource

  property :id             , Serial
  property :first_name     , String
  property :last_name      , String
  property :email_address  , String
  property :user_name      , String
  property :password       , String
  property :created_at     , DateTime

end 


