require "data_mapper"
require "dm-postgres-adapter"

class Properties
  include DataMapper::Resource

  property :id         , Serial
  property :address    , String
  property :type       , String
  property :location   , String
  property :created_at , DateTime

end
