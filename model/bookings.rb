require "data_mapper"
require "dm-postgres-adapter"

class Booking
  include DataMapper::Resource

  property :id           , Serial
  property :check_in     , DateTime
  property :check_out    , DateTime

  belongs_to :listing

end
