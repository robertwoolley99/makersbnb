require "data_mapper"
require "dm-postgres-adapter"

class Booking
  include DataMapper::Resource

  property :id           , Serial
  property :check_in     , String
  property :check_out    , String

  belongs_to :listing

end
